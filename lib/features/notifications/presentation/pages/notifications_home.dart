import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:get/get.dart';

import '../../../../core/ui/colors_brand.dart';
import '../../../../core/ui/layout.dart';
import '../../../../core/ui/spacing.dart';
import '../widgets/notification_card.dart';

class NotificationHome extends StatelessWidget {
  const NotificationHome({super.key});


  @override
  Widget build(BuildContext context) {
  RemoteMessage? message = Get.arguments?['message']??RemoteMessage();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white[0],
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFF3962E),
            ),
            onPressed: Get.back,
          ),
          title: const Text(
            'Notificaciones',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: UILayout.medium,
              fontWeight: FontWeight.w800,
              color: Color(0xFF111007),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CardNotification(
                title: message?.notification?.title?.toString()??'',
                detail:  message?.notification?.body?.toString()??'',
                onTap: () {},
              ),
              Spacing.spacingV12,
              CardNotification(
                title: 'No olvides que puedes ser monitor',
                detail: 'Puedes entrar a enrolarte como monitor',
                onTap: () {},
              ),
              Spacing.spacingV12,
              CardNotification(
                title: 'Has creado tu cuenta exitosamente',
                detail: 'Gracias por acceder a Curi App',
                onTap: () {},
              ),
              Spacing.spacingV12,
            ],
          ),
        ),
      );
  }
}
