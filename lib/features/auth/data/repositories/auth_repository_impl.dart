// ignore_for_file: lines_longer_than_80_chars

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../domain/repositories/auth_repository.dart';
import 'users_repository_impl.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  static String uid = '';

  @override
  Future<Either<String, User?>> signup({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String career,
    required String studentCode,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set(<String, dynamic>{
        'name': name,
        'phone': phone,
        'career': career,
        'studentCode': studentCode,
        'type': 'student',
      });
      uid = credential.user!.uid;
      UsersRepositoryImpl userData = UsersRepositoryImpl();
      await userData.getUser(uid);
      return Right<String, User?>(credential.user);
    } catch (e) {
      return Left<String, User?>(
        e is FirebaseAuthException
            ? e.code.tr
            : 'No se pudo Crear el usuario, intentelo más tarde',
      );
    }
  }

  @override
  Future<Either<String, User?>> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      uid = credential.user!.uid;
      return Right<String, User?>(credential.user);
    } catch (e) {
      return Left<String, User?>(
        e is FirebaseAuthException
            ? e.code.tr
            : 'Estamos teniendo problemas con el inicio de sesión, intentalo más tarde',
      );
    }
  }

  String getuid() => uid;
  
  @override
  Future<Either<String, dynamic>> forgotPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return const Right<String, dynamic>('Se envió un correo de recuperación a tu cuenta, espera unos minutos.');
    } catch (e) {
     return Left<String, dynamic>(  e is FirebaseAuthException
            ? e.code.tr
            : 'Estamos teniendo problemas con el inicio de sesión, intentalo más tarde',);
    }
  }
}
