import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

// import '../../../main.dart';

class FirebaseApi {
  final FirebaseMessaging _firebaseMEssaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMEssaging.requestPermission();

    final fCMtoken = await _firebaseMEssaging.getToken();
    print('Token $fCMtoken');
    await initPushNotifications();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) {
      return;
    }
    Get.toNamed(
      '/notifications_home',
      arguments: <String, dynamic>{
        'message': message,
      },
    );
  }

  Future<void> initPushNotifications() async {
    await FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
