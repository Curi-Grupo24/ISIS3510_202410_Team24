import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/classes_repository.dart';
import '../models/class_model.dart';

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
  Future<Either<String, Map<String, dynamic>?>> getMyClasess(String uid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('classes').doc(uid).get();

      ClassModel eachClass =
          ClassModel.fromJson(snapshot.data() ?? <String, dynamic>{});
      return Right(snapshot.data());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ClassModel>>> fetchAllClasess() async {
    try {
      CollectionReference<Object?> _collectionRef =
          FirebaseFirestore.instance.collection('classses');
      QuerySnapshot<Object?> querySnapshot = await _collectionRef.get();
      List<ClassModel> allData = querySnapshot.docs
          .map(
            (QueryDocumentSnapshot<Object?> doc) => ClassModel.fromJson(
              doc.data()! as Map<String, dynamic>,
            ),
          )
          .toList();
      return Right<String, List<ClassModel>>(allData);
    } catch (e) {
      return Left<String, List<ClassModel>>(e.toString());
    }
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
