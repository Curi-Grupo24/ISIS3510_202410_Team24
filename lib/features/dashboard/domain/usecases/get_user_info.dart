import 'package:dartz/dartz.dart';

import '../../../auth/data/repositories/auth_repository_impl.dart';
import '../repositories/dashboard_repository.dart';

class GetUserInfoUseCase {
  GetUserInfoUseCase({required this.repository});
  final DashboardRepository repository;

  Future<Either<String, String>> call() async =>
      repository.getUserName(
        AuthRepositoryImpl.uid,
      );
}
