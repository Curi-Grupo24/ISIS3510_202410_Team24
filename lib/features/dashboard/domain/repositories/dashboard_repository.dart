import 'package:dartz/dartz.dart';

import '../../../classes_list/data/models/class_model.dart';

abstract class DashboardRepository {
  Future<Map<String, dynamic>?> getUser(String uid);
  Future<Either<String, Map<String, dynamic>>> getUserName(String uid);
  Future<Either<String, List<ClassModel>>> getMyClasess();
}
