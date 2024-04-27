import 'package:dartz/dartz.dart';

import '../../data/models/tutor_model.dart';
import '../repositories/class_flow_repository.dart';

class AddTutorToFavsUseCase {
  AddTutorToFavsUseCase({required this.repository});
  final ClassFlowRepository repository;

  Future<Either<String, String>> call({
    required TutorModel tutorsToAdd,
  }) async =>
      repository.addTutorToFavs(tutorToAddFav: tutorsToAdd);
}
