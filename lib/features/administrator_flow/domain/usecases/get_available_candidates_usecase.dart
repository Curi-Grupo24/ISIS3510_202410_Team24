import 'package:dartz/dartz.dart';

import '../repositories/available_candidates_repository.dart';

class GetAvailableCandidatesUseCase {
  GetAvailableCandidatesUseCase({required this.repository});
  final AvailableCandidatesRepository repository;

  Future<Either<String, String>> call() async =>
      repository.getAvailableCandidates();
}
