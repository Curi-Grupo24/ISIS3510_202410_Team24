import 'package:dartz/dartz.dart';

import '../../data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<String, UserModel>> signup({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String career,
    required String studentCode,
  });

  Future<Either<String, UserModel>> login({
    required String email,
    required String password,
  });

  Future<Either<String, dynamic>> forgotPassword({
    required String email,
  });
}
