import 'package:flutter/material.dart';

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void changeTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData lightMode = ThemeData(
    backgroundColor: const Color(0xFFFAFAFA),
    accentColor: Color(0xFFAA00FF),
    primaryColor: const Color(0xFFFFFFFF),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF651FFF),
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline6: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
      ),
      actionsIconTheme: IconThemeData(
        color: Color(0xFFFFFFFF),
      ),
    ),
    brightness: Brightness.light,
    fontFamily: 'Roboto',
  );

  static ThemeData darkMode = ThemeData(
    backgroundColor: const Color(0xFF313C44),
    primaryColor: const Color(0xFF151B20),
    accentColor: Color(0xFFAA00FF),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF151B20),
      brightness: Brightness.dark,
      textTheme: TextTheme(
        headline6: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
      ),
      actionsIconTheme: IconThemeData(
        color: Color(0xFFFFFFFF),
      ),
    ),
    brightness: Brightness.dark,
    fontFamily: 'Roboto',
  );
}
