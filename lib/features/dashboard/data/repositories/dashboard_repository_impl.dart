import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../auth/data/repositories/users_repository_impl.dart';
import '../../../classes_list/data/models/class_model.dart';
import '../../domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl({
    required this.networkInfo,
  });
  final NetworkInfo networkInfo;

  @override
  Future<Map<String, dynamic>?> getUser(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return snapshot.data();
  }

  @override
  Future<Either<String, Map<String, dynamic>>> getUserName(String uid) async {
    if (await networkInfo.isConnected) {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      Map<String, dynamic>? data = snapshot.data();
      String name = data!['name'] ?? 'N/A';
      String type = data['type'] ?? 'N/A';

      return name != 'N/A'
          ? Right<String, Map<String, dynamic>>(
              <String, dynamic>{
                'name': name,
                'type': type,
              },
            )
          : const Left<String, Map<String, dynamic>>(
              'Newie',
            );
    } else {
      return Left<String, Map<String, dynamic>>(
        const NetworkFailure().errorMessage,
      );
    }
  }

  @override
  Future<Either<String, List<ClassModel>>> getMyClasess() async {
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
        List<ClassModel> classModelList = <ClassModel>[];

        for (String element in listClasses) {
          CollectionReference<Object?> _collectionRef =
              FirebaseFirestore.instance.collection('classses');
          Query<Object?> query =
              _collectionRef.where('uid', isEqualTo: element);
          QuerySnapshot<Object?> querySnapshot = await query.get();
          if (querySnapshot.docs.isEmpty) {
            return const Left<String, List<ClassModel>>(
              'No tienes clases inscritas',
            );
          }
          QueryDocumentSnapshot<Object?> doc = querySnapshot.docs.first;
          classModelList
              .add(ClassModel.fromJson(doc.data()! as Map<String, dynamic>));
        }
        return Right<String, List<ClassModel>>(classModelList);
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
  Future<Either<String, List<ClassModel>>> getMyTutorClasses() async {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      String userId = _auth.currentUser?.uid ?? '';
      UsersRepositoryImpl userData = UsersRepositoryImpl();
      Map<String, dynamic> rawData =
          await userData.getUser(userId) ?? <String, dynamic>{};
      List<String> listClasses =
          (rawData['myTutorClasses'] as List<dynamic>?)?.cast<String>() ??
              const <String>[];
      List<ClassModel> classModelList = <ClassModel>[];

      for (String element in listClasses) {
        CollectionReference<Object?> _collectionRef =
            FirebaseFirestore.instance.collection('classses');
        Query<Object?> query = _collectionRef.where('uid', isEqualTo: element);
        QuerySnapshot<Object?> querySnapshot = await query.get();
        if (querySnapshot.docs.isEmpty) {
          return const Left<String, List<ClassModel>>(
            'No tienes clases inscritas',
          );
        }
        QueryDocumentSnapshot<Object?> doc = querySnapshot.docs.first;
        classModelList
            .add(ClassModel.fromJson(doc.data()! as Map<String, dynamic>));
      }
      return Right<String, List<ClassModel>>(classModelList);
    } catch (e) {
      return Left<String, List<ClassModel>>(e.toString());
    }
  }
}
