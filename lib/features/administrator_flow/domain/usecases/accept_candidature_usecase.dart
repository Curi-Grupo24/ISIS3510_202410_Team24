import 'package:dartz/dartz.dart';

import '../repositories/available_candidates_repository.dart';

class AcceptCandidateUseCase {
  AcceptCandidateUseCase({required this.repository});
  final AvailableCandidatesRepository repository;

  Future<Either<String, List<Map<String, dynamic>>>> call({
    required Map<String, dynamic> candidate,
  }) async =>
      repository.acceptCandidate(candidate);
}
