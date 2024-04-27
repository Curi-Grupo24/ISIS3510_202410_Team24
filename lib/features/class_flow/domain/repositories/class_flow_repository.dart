// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';

import '../../data/models/tutor_model.dart';

abstract class ClassFlowRepository {
  Future<Either<String, List<TutorModel>>> fetchClassDashboardInfo({
    required List<String> tutorsIds,
  });
  Future<Either<String, String>> addTutorToFavs({
    required TutorModel tutorToAddFav,
  });
}
