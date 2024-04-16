import 'package:dartz/dartz.dart';

import '../../../auth/data/models/user_model.dart';
import '../../../auth/data/repositories/auth_repository_impl.dart';
import '../repositories/dashboard_repository.dart';

class GetUserInfoUseCase {
  GetUserInfoUseCase({required this.repository});
  final DashboardRepository repository;

  Future<Either<String, UserModel>> call() async {
    Map<String, dynamic> x = await repository.getUser(
          AuthRepositoryImpl.uid,
        ) ??
        <String, dynamic>{};
    UserModel y = UserModel.fromJson(x);
    return Right<String, UserModel>(y);
  }
}
