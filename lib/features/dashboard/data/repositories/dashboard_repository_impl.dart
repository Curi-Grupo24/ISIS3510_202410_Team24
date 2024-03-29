import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl();

  @override
  Future<Map<String, dynamic>?> getUser(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return snapshot.data();
  }

  @override
  Future<Either<String, Map<String, dynamic>>> getUserName(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    Map<String, dynamic>? data = snapshot.data();
    String name = data!['name'] ?? 'N/A';
    String type = data['type'] ?? 'N/A';

    return name != 'N/A'
        ? Right<String, Map<String, dynamic>>(
            <String, dynamic>{
              'name': name,
              'type': type,
            },
          )
        : const Left<String, Map<String, dynamic>>(
            'Newie',
          );
  }
}
