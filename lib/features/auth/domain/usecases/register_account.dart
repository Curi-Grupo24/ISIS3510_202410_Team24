import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../repositories/auth_repository.dart';

class RegisterAccountUseCase {
  RegisterAccountUseCase({required this.repository});
  final AuthRepository repository;

  Future<Either<String, User?>> call({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String career,
    required String studentCode,
  }) async =>
      repository.signup(
          email: email,
          password: password,
          name: name,
          phone: phone,
          career: career,
          studentCode: studentCode);
}
