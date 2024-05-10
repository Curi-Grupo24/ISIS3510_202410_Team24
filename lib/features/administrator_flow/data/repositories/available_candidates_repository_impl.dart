import 'package:dartz/dartz.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/available_candidates_repository.dart';

class AvailableCandidatesRepositoryImpl
    implements AvailableCandidatesRepository {
  AvailableCandidatesRepositoryImpl({
    required this.networkInfo,
  });
  final NetworkInfo networkInfo;


  @override
  Future<Either<String, String>> getAvailableCandidates() {
    // Poner el método
    throw UnimplementedError();
  }
}
