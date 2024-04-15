import 'package:dartz/dartz.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl();

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  static String uid = '';

  @override
  Future<Either<String, dynamic>> getChat({
    required String email,
    required String password,
  }) {
   
    throw UnimplementedError();
  }
}
