import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../notifications/presentation/widgets/local_notifications.dart';
import '../../domain/repositories/schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  ScheduleRepositoryImpl();

  @override
  Future<Either<String, String>> addSoloSchedule(
    Map<String, dynamic> addedschedule,
  ) async {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      String uid = _auth.currentUser?.uid ?? '';
      print("-----------------------------------------------------");
      DateTime date = DateTime.parse(addedschedule['initialDate']);
      await NotificationHelper.init();
      await NotificationHelper.scheduleNotification(
          'No te pierdas tu monitoria',
          'La monitoria comienza ya alistate!',
          date);
      print("-----------------------------------------------------");
      addedschedule.addAll(<String, dynamic>{'uid': uid});
      await FirebaseFirestore.instance
          .collection('schedule')
          .doc()
          .set(addedschedule);
      return Right<String, String>(
        'Se Agregó correctamente a tu calendario'.tr,
      );
    } catch (e) {
      return Left<String, String>(
        'No se pudo agendar tu schedule'.tr,
      );
    }
  }

  @override
  Future<Map<String, dynamic>?> getSchedule(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('schedule').doc(uid).get();
    return snapshot.data();
  }

  @override
  Future<String> updateSchedule(
    String uid,
    Map<String, dynamic> scheduleFields,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('schedule')
          .doc(uid)
          .update(scheduleFields);
      return 'Se cambio la informacion correctamente';
    } catch (e) {
      return 'No se encontro schedule';
    }
  }

  @override
  Future<String> deleteSchedule(String uid) async {
    try {
      await FirebaseFirestore.instance.collection('schedule').doc(uid).delete();
      return 'Se elimino el schedule';
    } catch (e) {
      return 'No se encontro schedule';
    }
  }
}
