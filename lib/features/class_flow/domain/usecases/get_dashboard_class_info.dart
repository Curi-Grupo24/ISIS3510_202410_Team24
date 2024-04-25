import 'package:dartz/dartz.dart';

import '../../data/models/tutor_model.dart';
import '../repositories/class_flow_repository.dart';

class FetchDashbaordClassInfoUseCase {
  FetchDashbaordClassInfoUseCase({required this.repository});
  final ClassFlowRepository repository;

  Future<Either<String, List<TutorModel>>> call({
    required List<String> tutorsIdsList,
  }) async =>
      repository.fetchClassDashboardInfo(tutorsIds: tutorsIdsList);
}
