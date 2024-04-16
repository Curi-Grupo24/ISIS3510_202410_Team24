import 'package:dartz/dartz.dart';

import '../../data/models/class_model.dart';
import '../repositories/classes_repository.dart';

class FetchAllClassesUseCase {
  FetchAllClassesUseCase({required this.repository});
  final ClassRepository repository;

  Future<Either<String, List<ClassModel>>> call() async =>
      repository.fetchAllClasess();
}
