// ignore_for_file: lines_longer_than_80_chars

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogsRepositoryImpl {
  LogsRepositoryImpl();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> addLogs(String uid, Map<String, dynamic> addedlogs) async {
    try {
      await FirebaseFirestore.instance
          .collection('logs')
          .doc(uid)
          .set(addedlogs);
      return 'Se pudo agregar el log';
    } catch (e) {
      return 'No se pudo agregar el log';
    }
  }

  Future<Map<String, dynamic>?> getLogs(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('logs').doc(uid).get();
    return snapshot.data();
  }

  Future<String> updateLogs(String uid, Map<String, dynamic> logFields) async {
    try {
      await FirebaseFirestore.instance
          .collection('logs')
          .doc(uid)
          .update(logFields);
      return 'Se cambio la informacion correctamente';
    } catch (e) {
      return 'No se encontro el log';
    }
  }

  Future<String> deleteLogs(String uid) async {
    try {
      await FirebaseFirestore.instance.collection('logs').doc(uid).delete();
      return 'Se elimino el log';
    } catch (e) {
      return 'No se encontro log';
    }
  }
}
