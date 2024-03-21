import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../repositories/auth_repository.dart';

class LoginAccountUseCase {
  LoginAccountUseCase({required this.repository});
  final AuthRepository repository;

  Future<Either<String, User?>> call({
    required String email,
    required String password,
  }) async =>
      repository.login(
        email: email,
        password: password,
      );
}
