import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin _notification =
      FlutterLocalNotificationsPlugin();
  // ignore: always_declare_return_types
  static init() {
    _notification.initialize(const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher')));
    tz.initializeTimeZones();
  }

  static scheduleNotification(
    String title,
    String body,
    DateTime date,
  ) async {
    AndroidNotificationDetails androidDetails =
        const AndroidNotificationDetails(
      'important_notification',
      'My Channel',
      importance: Importance.max,
      priority: Priority.high,
    );
    DateTime now = DateTime.now();
    print(now);
    print(date);
    int sec = date.difference(now).inSeconds;
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);
    print(sec);
    await _notification.zonedSchedule(
        0,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(Duration(seconds: sec)),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
  }
}
