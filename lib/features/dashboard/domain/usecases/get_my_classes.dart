import 'package:dartz/dartz.dart';

import '../../../classes_list/data/models/class_model.dart';
import '../repositories/dashboard_repository.dart';

class GetMyClassesUseCase {
  GetMyClassesUseCase({required this.repository});
  final DashboardRepository repository;

  Future<Either<String, List<ClassModel>>> call() async =>
      repository.getMyClasess(
      );
}
