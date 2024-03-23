import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Map<String, dynamic>?> getUser(String uid);
  Future<Either<String, String>> getUserName(String uid);
}
