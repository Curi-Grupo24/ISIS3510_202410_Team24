import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<Either<String, User?>> signup(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(credential.user);
    } catch (e) {
      return const Left<String, User?>(
        'No se pudo Crear el usuario, intentelo más tarde',
      );
    }
  }

  @override
  Future<Either<String, User?>> login(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right<String, User?>(credential.user);
    } catch (e) {
      return const Left<String, User?>(
        'No se pudo iniciar sesión, intentelo más tarde',
      );
    }
  }
}
