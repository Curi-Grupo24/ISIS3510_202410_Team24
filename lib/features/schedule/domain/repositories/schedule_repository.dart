abstract class ScheduleRepository {
  Future<String> addSchedule(
    String uid,
    Map<String, dynamic> addedschedule,
  );
  Future<Map<String, dynamic>?> getSchedule(String uid);
  Future<String> updateSchedule(
    String uid,
    Map<String, dynamic> scheduleFields,
  );
  Future<String> deleteSchedule(String uid);
}
