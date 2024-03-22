import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/repositories/classes_repository.dart';

class ClasessRepositoryImpl implements ClassRepository {
  ClasessRepositoryImpl();

  @override
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

  @override
  Future<Map<String, dynamic>?> getClasess(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('classes').doc(uid).get();
    return snapshot.data();
  }

  @override
  Future<String> updateClasess(
    String uid,
    Map<String, dynamic> changingClass,
  ) async {
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

  @override
  Future<String> deleteClasess(String uid) async {
    try {
      await FirebaseFirestore.instance.collection('classes').doc(uid).delete();
      return 'Se elimino la clase';
    } catch (e) {
      return 'No se encontro la clase';
    }
  }
}
