import 'package:dartz/dartz.dart';

abstract class DashboardRepository {
  Future<Map<String, dynamic>?> getUser(String uid);
  Future<Either<String, Map<String, dynamic>>> getUserName(String uid);
}
