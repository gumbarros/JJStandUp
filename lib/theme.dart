import 'package:flutter/material.dart';

class StandUpTheme {
  static ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.orange,
      primaryColor: Color.fromRGBO(237, 134, 0, 1),
      appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: Color.fromRGBO(237, 134, 0, 1),
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(
              headline6: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700))),
      textTheme: TextTheme(headline6: TextStyle(color: Colors.black54)));
  static ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.orange,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(brightness: Brightness.dark));
}
