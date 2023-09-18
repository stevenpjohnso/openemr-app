import '../../../responsive/desktop_body.dart';
import '../../../responsive/mobile_body.dart';
import '../../../responsive/responsive_layout.dart';
import '../../../responsive/tablet_body.dart';
import 'package:flutter/material.dart';
import 'package:openemr/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => const Scaffold(
        body: ResponsiveLayout(
          mobileBody: MobileScaffold(),
          tabletBody: TabletScaffold(),
          desktopBody: DesktopScaffold(),
        ),
      ),
    );
  }
}
