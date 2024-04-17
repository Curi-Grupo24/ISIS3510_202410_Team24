import 'package:dartz/dartz.dart';

import '../../data/models/user_model.dart';
import '../repositories/auth_repository.dart';

class LoginAccountUseCase {
  LoginAccountUseCase({required this.repository});
  final AuthRepository repository;

  Future<Either<String, UserModel>> call({
    required String email,
    required String password,
  }) async =>
      repository.login(
        email: email,
        password: password,
      );
}
