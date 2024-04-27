import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../auth/data/repositories/users_repository_impl.dart';
import '../../domain/repositories/classes_repository.dart';
import '../models/class_model.dart';

class ClasessRepositoryImpl implements ClassRepository {
  ClasessRepositoryImpl({
    required this.networkInfo,
  });

  final NetworkInfo networkInfo;

  @override
  Future<Either<String, String>> addClass(ClassModel classToAdd) async {
    if (await networkInfo.isConnected) {
      try {
        FirebaseAuth _auth = FirebaseAuth.instance;
        String userId = _auth.currentUser?.uid ?? '';
        UsersRepositoryImpl userData = UsersRepositoryImpl();
        Map<String, dynamic> rawData =
            await userData.getUser(userId) ?? <String, dynamic>{};
        List<String> listClasses =
            (rawData['myClasses'] as List<dynamic>?)?.cast<String>() ??
                const <String>[];
        if (!listClasses.contains(classToAdd.uid)) {
          listClasses.add(classToAdd.uid);
        } else {
          return Left<String, String>(
            '''Ya tenías inscrita la clase de: ${classToAdd.className}''',
          );
        }

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update(<String, dynamic>{'myClasses': listClasses});
        return Right<String, String>(
          '''Se a añadido la clase \' ${classToAdd.className} \' correctamente''',
        );
      } catch (e) {
        return Left<String, String>(e.toString());
      }
    } else {
      return Left<String, String>(
        const NetworkFailure().errorMessage,
      );
    }
  }

  @override
  Future<Either<String, List<ClassModel>>> fetchAllClasess() async {
    if (await networkInfo.isConnected) {
      try {
        CollectionReference<Object?> _collectionRef =
            FirebaseFirestore.instance.collection('classses');
        QuerySnapshot<Object?> querySnapshot = await _collectionRef.get();
        List<ClassModel> allData = querySnapshot.docs
            .map(
              (QueryDocumentSnapshot<Object?> doc) => ClassModel.fromJson(
                doc.data()! as Map<String, dynamic>,
              ),
            )
            .toList();
        return Right<String, List<ClassModel>>(allData);
      } catch (e) {
        return Left<String, List<ClassModel>>(e.toString());
      }
    } else {
      return Left<String, List<ClassModel>>(
        const NetworkFailure().errorMessage,
      );
    }
  }

  @override
  Future<String> updateClasess(
    String uid,
    Map<String, dynamic> changingClass,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('classes')
          .doc(uid)
          .update(changingClass);
      return 'Se cambio la informacion correctamente';
    } catch (e) {
      return 'No se encontro usuario';
    }
  }

  @override
  Future<Either<String, String>> deleteClass(ClassModel classtoDelete) async {
    if (await networkInfo.isConnected) {
      try {
        FirebaseAuth _auth = FirebaseAuth.instance;
        String userId = _auth.currentUser?.uid ?? '';
        UsersRepositoryImpl userData = UsersRepositoryImpl();
        Map<String, dynamic> rawData =
            await userData.getUser(userId) ?? <String, dynamic>{};
        List<String> listClasses =
            (rawData['myClasses'] as List<dynamic>?)?.cast<String>() ??
                const <String>[];
        if (listClasses.contains(classtoDelete.uid)) {
          listClasses.remove(classtoDelete.uid);
        } else {
          return Left<String, String>(
            '''Ya se ha eliminado la clase: ${classtoDelete.className}''',
          );
        }

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update(<String, dynamic>{'myClasses': listClasses});

        return Right<String, String>(
          'Se eliminó correctamente \" ${classtoDelete.className}\"',
        );
      } catch (e) {
        return Left<String, String>(e.toString());
      }
    } else {
      return Left<String, String>(
        const NetworkFailure().errorMessage,
      );
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>?>> getMyClasess(String uid) {
    throw UnimplementedError();
  }
}
