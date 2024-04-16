import '../../../auth/data/repositories/auth_repository_impl.dart';
import '../repositories/profile_repository.dart';

class GetProfileUserInfoUseCase {
  GetProfileUserInfoUseCase({required this.repository});
  final ProfileRepository repository;

  Future<Map<String, dynamic>?> call() async => repository.getUser(
        AuthRepositoryImpl.uid,
      );
}
