import 'package:flutter/material.dart';
import 'package:openemr/login.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'util/my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('es', 'US')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyTheme(),
      child: Consumer<MyTheme>(
        builder: (context, MyTheme themeNotifier, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: themeNotifier.isDark
                  ? ThemeData(
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      brightness: Brightness.dark,
                      primaryColor: Colors.teal,
                      primarySwatch: Colors.teal)
                  : ThemeData(
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      brightness: Brightness.light,
                      primaryColor: Colors.blue,
                      primarySwatch: Colors.blue),
              home: const LoginPage());
        },
      ),
    );
  }
}

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
      ));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.teal,
      ));
}
