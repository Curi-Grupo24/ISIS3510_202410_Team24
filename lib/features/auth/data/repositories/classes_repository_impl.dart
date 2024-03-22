// ignore_for_file: lines_longer_than_80_chars

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ClasessRepositoryImpl {
  ClasessRepositoryImpl();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> addClass(String uid, Map<String, dynamic> addedclass) async {
    try {
      await FirebaseFirestore.instance
          .collection('classes')
          .doc(uid)
          .set(addedclass);
      return 'Se pudo agregar la clase';
    } catch (e) {
      return 'No se pudo agregar la clase';
    }
  }

  Future<Map<String, dynamic>?> getClasess(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('classes').doc(uid).get();
    return snapshot.data();
  }

  Future<String> updateClasess(
      String uid, Map<String, dynamic> changingClass) async {
    try {
      await FirebaseFirestore.instance
          .collection('classes')
          .doc(uid)
          .update(changingClass);
      return 'Se cambio la informacion correctamente';
    } catch (e) {
      return 'No se encontro usuario';
    }
  }

  Future<String> deleteClasess(String uid) async {
    try {
      await FirebaseFirestore.instance.collection('classes').doc(uid).delete();
      return 'Se elimino la clase';
    } catch (e) {
      return 'No se encontro la clase';
    }
  }
}
