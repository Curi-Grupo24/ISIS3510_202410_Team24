// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';

import '../../../classes_list/data/models/class_model.dart';

abstract class EnrollTutorRepository {
  Future<Either<String, String>> enrollAsTutor({
    required ClassModel classModel,
    required List<Map<int, Map<int, String>>> answersList,
    required String lastAnswer,
  });
}
