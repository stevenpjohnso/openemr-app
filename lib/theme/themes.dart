import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Themes {
  final lightTheme = ThemeData.light()
    ..copyWith(primaryColor: const Color(0xFFE0E9EF));
  final darkTheme = ThemeData.dark()
    ..copyWith(primaryColor: const Color(0xFF1E2A32));

  Color getBackgroundColor() {
    if (Get.isDarkMode) {
      return darkTheme.canvasColor;
    } else {
      return lightTheme.canvasColor;
    }
  }
}
