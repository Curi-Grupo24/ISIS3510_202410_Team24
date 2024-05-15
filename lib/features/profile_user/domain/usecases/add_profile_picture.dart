import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../repositories/profile_repository.dart';

class AddProfilePictureUseCase {
  AddProfilePictureUseCase({required this.repository});
  final ProfileRepository repository;

  Future<Either<String, String>> call({
    required Uint8List file,
  }) async =>
      repository.addProfilePicture(
        file: file,
      );
}
