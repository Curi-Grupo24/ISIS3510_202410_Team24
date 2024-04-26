import 'package:dartz/dartz.dart';

import '../../../classes_list/data/models/class_model.dart';
import '../repositories/enroll_tutor_repository.dart';

class EnrollTutorUseCase {
  EnrollTutorUseCase({required this.repository});
  final EnrollTutorRepository repository;

  Future<Either<String, String>> call({
    required ClassModel classToAdd,
    required List<Map<int, Map<int, String>>> answersList,
    required String lastAnswer,
  }) async =>
      repository.enrollAsTutor(
        classModel: classToAdd,
        answersList: answersList,
        lastAnswer: lastAnswer,
      );
}
