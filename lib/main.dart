import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:openemr/app/modules/login/login_binding.dart';
import 'package:openemr/app/modules/login/login_page.dart';
import 'package:openemr/theme/theme_service.dart';
import 'package:openemr/util/texts.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
import 'theme/themes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      defaultTransition: Transition.native,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      translations: Texts(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      initialBinding: LoginBinding(),
      home: const LoginPage(),
    );
  }
}
