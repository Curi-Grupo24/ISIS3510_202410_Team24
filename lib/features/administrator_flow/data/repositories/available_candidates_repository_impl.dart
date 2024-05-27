// ignore_for_file: cascade_invocations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../auth/data/repositories/users_repository_impl.dart';
import '../../../classes_list/data/models/class_model.dart';
import '../../domain/repositories/available_candidates_repository.dart';

class AvailableCandidatesRepositoryImpl
    implements AvailableCandidatesRepository {
  AvailableCandidatesRepositoryImpl({
    required this.networkInfo,
  });
  final NetworkInfo networkInfo;

  @override
  Future<Either<String, List<Map<String, dynamic>>>>
      getAvailableCandidates() async {
    // Poner el método
    if (await networkInfo.isConnected) {
      try {
        CollectionReference<Object?> _collectionRef =
            FirebaseFirestore.instance.collection('tutor_enrollment');
        QuerySnapshot<Object?> querySnapshot = await _collectionRef.get();
        List<Map<String, dynamic>> allData = querySnapshot.docs
            .map(
              (QueryDocumentSnapshot<Object?> doc) =>
                  doc.data()! as Map<String, dynamic>,
            )
            .toList();
        List<Map<String, dynamic>> listOfcandidatures =
            <Map<String, dynamic>>[];
        for (int i = 0; i < allData.length; i++) {
          String userId = allData[i]['user_id'] ?? '';
          UsersRepositoryImpl userData = UsersRepositoryImpl();
          Map<String, dynamic> rawUserData =
              await userData.getUser(userId) ?? <String, dynamic>{};

          CollectionReference<Object?> _collectionRef =
              FirebaseFirestore.instance.collection('classses');
          Query<Object?> query =
              _collectionRef.where('uid', isEqualTo: allData[i]['class_id']);
          QuerySnapshot<Object?> querySnapshot = await query.get();
          QueryDocumentSnapshot<Object?> doc = querySnapshot.docs.first;
          ClassModel classToUSe =
              ClassModel.fromJson(doc.data()! as Map<String, dynamic>);

          Map<String, dynamic> eachCandidate = <String, dynamic>{
            'userName': rawUserData['name'],
            'userEmail': rawUserData['email'],
            'userUid': userId,
            'userCareer': rawUserData['career'],
            'classname': classToUSe.className,
            'classuid': allData[i]['class_id'],
            'profilePicture': rawUserData['profilePicture'] ??
                'https://static.vecteezy.com/system/resources/thumbnails/036/280/651/small_2x/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg',
            'userFirstAnswer': allData[i]['answers'][0],
            'userSecondAnswer': allData[i]['answers'][1],
            'userThirdAnswer': allData[i]['answers'][2],
            'userFourthAnswer': allData[i]['answers'][3],
          };
          listOfcandidatures.add(eachCandidate);
        }

        return Right<String, List<Map<String, dynamic>>>(listOfcandidatures);
      } catch (e) {
        return Left<String, List<Map<String, dynamic>>>(e.toString());
      }
    } else {
      return Left<String, List<Map<String, dynamic>>>(
        const NetworkFailure().errorMessage,
      );
    }
  }

  @override
  Future<Either<String, List<Map<String, dynamic>>>> acceptCandidate(
    Map<String, dynamic> candidate,
  ) async {
    if (await networkInfo.isConnected) {
      CollectionReference<Object?> _collectionRef =
          FirebaseFirestore.instance.collection('tutor_enrollment');
      QuerySnapshot<Object?> querySnapshot = await _collectionRef.get();
      String idCandidate = candidate['userUid'];

      List<Map<String, dynamic>> allData = querySnapshot.docs
          .map(
            (QueryDocumentSnapshot<Object?> doc) =>
                doc.data()! as Map<String, dynamic>,
          )
          .toList();

      allData.forEach((Map<String, dynamic> document) {
        if (document['user_id'] == idCandidate) {
          // Eliminar el documento encontrado
          DocumentReference<Object?> docRef =
              _collectionRef.doc();
          docRef.delete();
          print(
              "Documento con idCandidate $idCandidate eliminado correctamente.");
        }
      });

      List<Map<String, dynamic>> listOfcandidatures = <Map<String, dynamic>>[];

      return Right<String, List<Map<String, dynamic>>>(listOfcandidatures);
    } else {
      return Left<String, List<Map<String, dynamic>>>(
        const NetworkFailure().errorMessage,
      );
    }
  }
}
