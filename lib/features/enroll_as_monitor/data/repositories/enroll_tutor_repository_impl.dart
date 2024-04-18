import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../auth/data/repositories/users_repository_impl.dart';
import '../../../classes_list/data/models/class_model.dart';
import '../../domain/repositories/enroll_tutor_repository.dart';

class EnrollTutorRepositoryImpl implements EnrollTutorRepository {
  EnrollTutorRepositoryImpl();

  @override
  Future<Either<String, String>> enrollAsTutor({
    required ClassModel classModel,
    required List<Map<int, Map<int, String>>> answersList,
    required String lastAnswer,
  }) async {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      String userId = _auth.currentUser?.uid ?? '';
      UsersRepositoryImpl userData = UsersRepositoryImpl();
      Map<String, dynamic> rawData =
          await userData.getUser(userId) ?? <String, dynamic>{};
      List<String> listClasses =
          (rawData['myTutorClasses'] as List<dynamic>?)?.cast<String>() ??
              const <String>[];
      if (!listClasses.contains(classModel.uid)) {
        listClasses.add(classModel.uid);
      } else {
        return Left<String, String>(
          '''Parece que ya tenías inscrita la clase de: ${classModel.className}''',
        );
      }
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update(<String, dynamic>{'myTutorClasses': listClasses});
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update(<String, dynamic>{'type': 'student-tutor'});
      List<String> waitingTutors = classModel.waitingAreaTutors..add(userId);
      await FirebaseFirestore.instance
          .collection('classses')
          .doc(classModel.uid)
          .update(<String, dynamic>{'waitingAreaTutors': waitingTutors});

      List<String> answers = <String>[];
      int count = 0;
      for (Map<int, Map<int, String>> answerMap in answersList) {
        Map<int, String> innerMap = answerMap[count]!;
        answers.add(innerMap.values.first);
        count++;
      }
      answers.add(lastAnswer);

      await FirebaseFirestore.instance
          .collection('tutor_enrollment')
          .doc()
          .set(<String, dynamic>{
        'answers': answers,
        'class_id': classModel.uid,
        'user_id': userId,
      });
      return Right<String, String>(
        '''Se a añadido postulación a la clase \'${classModel.className}\' correctamente''',
      );
    } catch (e) {
      return Left<String, String>(e.toString());
    }
  }
}
