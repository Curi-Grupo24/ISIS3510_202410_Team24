import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import './core/internazionalization/internationalization.dart';
import 'core/routes/routes.dart';
import 'core/ui/theme.dart';
import 'features/auth/presentation/pages/pages.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  di.init();
  runApp(
    const SafeArea(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'Flutter Demo',
        theme: UITheme.curiThemeData,
        supportedLocales: const <Locale>[
          Locale('en'),
          Locale('es'),
        ],
        locale: const Locale('es'),
        getPages: getRoutes,
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          // AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        translations: Internationalization(),
        home: const Login(),
        debugShowCheckedModeBanner: false,
      );
}
