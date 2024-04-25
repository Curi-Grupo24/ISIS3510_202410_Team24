import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../auth/data/models/user_model.dart';
import '../../domain/repositories/class_flow_repository.dart';

class ClassFlowRepositoryImpl implements ClassFlowRepository {
  ClassFlowRepositoryImpl();

  @override
  Future<Either<String, List<UserModel>>> fetchClassDashboardInfo({
    required List<String> tutorsIds,
  }) async {
    try {
      List<UserModel> tutors = <UserModel>[];
      if (tutorsIds.isNotEmpty) {
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance
                .collection('users')
                .where(FieldPath.documentId, whereIn: tutorsIds)
                .get();

        tutors = querySnapshot.docs
            .map(
              (QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
                  UserModel.fromJson(
                doc.data(),
              ),
            )
            .toList();
      }

      return Right<String, List<UserModel>>(
        tutors,
      );
    } catch (e) {
      return Left<String, List<UserModel>>(e.toString());
    }
  }
}
