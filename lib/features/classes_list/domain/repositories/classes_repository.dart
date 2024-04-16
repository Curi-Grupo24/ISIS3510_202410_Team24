import 'package:dartz/dartz.dart';

import '../../data/models/class_model.dart';

abstract class ClassRepository {

  Future<Either<String, String>> addClass(ClassModel addedclass);
  Future<Either<String, Map<String, dynamic>?>> getMyClasess(String uid);
  Future<String> updateClasess(
    String uid,
    Map<String, dynamic> changingClass,
  );
  Future<String> deleteClasess(String uid);
  Future<Either<String, List<ClassModel>>> fetchAllClasess();

}
