import 'package:cloud_firestore/cloud_firestore.dart';

class UsersRepositoryImpl {
  UsersRepositoryImpl();

  Future<Map<String, dynamic>?> getUser(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return snapshot.data();
  }

  Future<String> updateUser(
    String uid,
    Map<String, dynamic> userFields,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update(userFields);
      return 'Se cambio la informacion correctamente';
    } catch (e) {
      return 'No se encontro usuario';
    }
  }

  Future<String> deleteUser(String uid) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).delete();
      return 'Se elimino el usuario';
    } catch (e) {
      return 'No se encontro usuario';
    }
  }
}
