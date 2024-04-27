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
    print("----------------------");
    AndroidNotificationDetails androidDetails =
        const AndroidNotificationDetails(
      'important_notification',
      'My Channel',
      importance: Importance.max,
      priority: Priority.high,
    );
    tz.TZDateTime.from(date, tz.local);
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);
    await _notification.zonedSchedule(
        0,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 1)),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
    print("----------------------");
  }
}
