import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'app_en_us.dart';
import 'app_es_co.dart';
import 'auth_es_co.dart';
import 'dashboard_es_co.dart';

class Internationalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
        'es': <String, String>{
          ...appEsCo,
          ...authEsCo,
          ...dashboardEsCo,
        },
        'en': <String, String>{
          ...appEnUs,
        },
      };
}
