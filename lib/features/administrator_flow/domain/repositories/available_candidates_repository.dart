import 'package:dartz/dartz.dart';

abstract class AvailableCandidatesRepository {
  Future<Either<String, List<Map<String, dynamic>>>> getAvailableCandidates();
}
