import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl();

  @override
  Future<Map<String, dynamic>?> getUser(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return snapshot.data();
  }

  @override
  Future<Either<String, String>> getUserName(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    Map<String, dynamic>? data = snapshot.data();
    String name = data!['name'] ?? 'N/A';

    return name != 'N/A'
        ? Right<String, String>(name)
        : const Left<String, String>('Newie');
  }

  @override
  Future<Either<String, String>> addProfilePicture({
   required Uint8List file,
  }) async {
    try {
      FirebaseStorage _storage = FirebaseStorage.instance;
      FirebaseFirestore _firestore = FirebaseFirestore.instance;
      FirebaseAuth _auth = FirebaseAuth.instance;
      String userId = _auth.currentUser?.uid ?? '';

      Reference ref = _storage.ref().child('profile:$userId');
      UploadTask uploadTask = ref.putData(file);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      // añadir a Firestore
      await _firestore
          .collection('users')
          .doc(userId)
          .update(<String, dynamic>{'profilePicture': downloadUrl});
      return Right<String, String>(downloadUrl);
    } catch (e) {
      return Left<String, String>(
        '''Ocurrió un error al subir la foto de perfil :c por ${e.toString()}''',
      );
    }

  }
}
