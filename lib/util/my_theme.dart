import 'package:flutter/material.dart';
import '../user.dart';

class MyTheme extends ChangeNotifier {
  bool _isDark = false;
  late MyThemePreferences _preferences;
  bool get isDark => _isDark;

  MyTheme() {
    _isDark = false;
    _preferences = MyThemePreferences();
    getPreferences();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }
}
