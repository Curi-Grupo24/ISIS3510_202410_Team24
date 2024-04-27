import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/class_flow_repository.dart';
import '../models/tutor_model.dart';

class ClassFlowRepositoryImpl implements ClassFlowRepository {
  ClassFlowRepositoryImpl({
    required this.networkInfo,
  });

  final NetworkInfo networkInfo;

  @override
  Future<Either<String, List<TutorModel>>> fetchClassDashboardInfo({
    required List<String> tutorsIds,
  }) async {
    if (await networkInfo.isConnected) {
    try {
      List<TutorModel> tutors = <TutorModel>[];
      if (tutorsIds.isNotEmpty) {
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance
                .collection('tutors_profile')
                .where(FieldPath.documentId, whereIn: tutorsIds)
                .get();

        tutors = querySnapshot.docs
            .map(
              (QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
                  TutorModel.fromJson(
                doc.data(),
              ),
            )
            .toList();
      }

      return Right<String, List<TutorModel>>(
        tutors,
      );
    } catch (e) {
      return Left<String, List<TutorModel>>(e.toString());
    }} else{
      return Left<String, List<TutorModel>>(
        const NetworkFailure().errorMessage,
      );
    }
  }
}
