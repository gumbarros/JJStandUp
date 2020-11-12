import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jj_standup/controllers/themeController.dart';
import 'package:jj_standup/theme.dart';
import 'views/standUpView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  ThemeController theme = Get.put(ThemeController());
  theme.getTheme();
  runApp(GetMaterialApp(
    home: StandUpView(),
    title: "JJ Stand Up",
    theme: StandUpTheme.lightTheme,
    darkTheme: StandUpTheme.darkTheme,
    defaultTransition: Transition.scale,
    themeMode: theme.themeMode,
    debugShowCheckedModeBanner: false,
  ));
}
