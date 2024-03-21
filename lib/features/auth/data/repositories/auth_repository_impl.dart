import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User?> signup({required String email, required String password}) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password,) ;
          return credential.user;
    } catch (e) {
      print('error: $e');
      //
    }
    return null;
  }
  
  @override
  Future<User?> login({required String email, required String password}) {
    
    throw UnimplementedError();
  }

  
}
