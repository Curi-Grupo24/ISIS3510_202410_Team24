import 'dart:typed_data';

import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Map<String, dynamic>?> getUser(String uid);
  Future<Either<String, String>> getUserName(String uid);
  Future <Either<String, String>> addProfilePicture({
  required  Uint8List file,
  });
}
