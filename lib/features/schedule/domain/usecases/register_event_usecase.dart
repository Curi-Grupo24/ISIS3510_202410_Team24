import 'package:dartz/dartz.dart';

import '../repositories/schedule_repository.dart';

class RegisterEventUseCase {
  RegisterEventUseCase({required this.repository});
  final ScheduleRepository repository;

  Future<Either<String, String>> call(
          {required Map<String, dynamic> classToAdd,}) async =>
      repository.addSoloSchedule(
        classToAdd,
      );
}
