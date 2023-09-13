import 'package:flutter/material.dart';
import 'responsive/mobile_body.dart';
import 'responsive/tablet_body.dart';
import 'responsive/desktop_body.dart';
import 'responsive/responsive_layout.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const DefaultTabController(
        length: 2,
        child: ResponsiveLayout(
          mobileBody: MobileScaffold(),
          tabletBody: TabletScaffold(),
          desktopBody: DesktopScaffold(),
        ),
      ),
    );
  }
}
