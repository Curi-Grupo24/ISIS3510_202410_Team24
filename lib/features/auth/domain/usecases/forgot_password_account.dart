import 'package:dartz/dartz.dart';

import '../repositories/auth_repository.dart';

class ForgotPasswordUseCase {
  ForgotPasswordUseCase({required this.repository});
  final AuthRepository repository;

  Future<Either<String, dynamic>> call({
    required String email,
  }) async =>
      repository.forgotPassword(
        email: email,
      );
}
