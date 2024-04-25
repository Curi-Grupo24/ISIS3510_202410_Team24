// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';

import '../../../auth/data/models/user_model.dart';

abstract class ClassFlowRepository {
  Future<Either<String, List<UserModel>>> fetchClassDashboardInfo({
    required List<String> tutorsIds,
  });
}
