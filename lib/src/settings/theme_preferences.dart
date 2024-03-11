import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const themeStatus = "THEMESTATUS";

  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.grey[100],
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final ThemeData darkTheme = ThemeData.dark();

  static final ThemePreferences _singleton = ThemePreferences._internal();

  factory ThemePreferences() {
    return _singleton;
  }

  ThemePreferences._internal();

  switchTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool currentTheme = prefs.getBool(themeStatus) ?? false;
    prefs.setBool(themeStatus, !currentTheme);
  }

  isDarkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeStatus) ?? false;
  }

  Future<ThemeData> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeStatus) ?? false ? darkTheme : lightTheme;
  }
}
