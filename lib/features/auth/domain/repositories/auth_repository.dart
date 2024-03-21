import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<Either<String, User?>> signup({
    required String email,
    required String password,
  });
  Future<Either<String, User?>> login({
    required String email,
    required String password,
  });
}
