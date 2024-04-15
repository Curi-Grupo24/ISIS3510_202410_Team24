
// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';

abstract class ChatRepository {

  Future<Either<String, dynamic>> getChat({
    required String email,
    required String password,
  });
}
