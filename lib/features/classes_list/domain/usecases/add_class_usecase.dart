import 'package:dartz/dartz.dart';

import '../../data/models/class_model.dart';
import '../repositories/classes_repository.dart';

class AddClassUseCase {
  AddClassUseCase({required this.repository});
  final ClassRepository repository;

  Future<Either<String, String>> call({required ClassModel classToAdd}) async =>
      repository.addClass(
        classToAdd,
      );
}
