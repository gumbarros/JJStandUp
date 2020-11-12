import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetController {
  static ThemeController get to => Get.find();

  SharedPreferences prefs;
  ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  Future<void> setThemeMode(ThemeMode themeMode) async {
    Get.changeThemeMode(themeMode);
    _themeMode = themeMode;
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', themeMode.toString().split('.')[1]);
  }

  void getTheme() async {
    ThemeMode themeMode;
    prefs = await SharedPreferences.getInstance();
    String themeText = prefs.getString('theme') ?? 'light';
    try {
      themeMode =
          ThemeMode.values.firstWhere((e) => describeEnum(e) == themeText);
    } catch (e) {
      themeMode = ThemeMode.system;
    }
    setThemeMode(themeMode);
  }
}