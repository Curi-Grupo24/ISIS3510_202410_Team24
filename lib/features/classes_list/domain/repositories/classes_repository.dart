abstract class ClassRepository {

  Future<String> addClass(String uid, Map<String, dynamic> addedclass);
  Future<Map<String, dynamic>?> getClasess(String uid);
  Future<String> updateClasess(
    String uid,
    Map<String, dynamic> changingClass,
  );
  Future<String> deleteClasess(String uid);

}
