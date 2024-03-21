

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> signup({required String email, required String password});
  Future<User?> login({required String email, required String password});
}
