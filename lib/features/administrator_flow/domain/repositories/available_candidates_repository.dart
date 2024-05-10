import 'package:dartz/dartz.dart';

abstract class AvailableCandidatesRepository {
  Future<Either<String, String>> getAvailableCandidates();
}
