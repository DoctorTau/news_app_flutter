import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const THEME_STATUS = "THEMESTATUS";

  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.grey[100],
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final ThemeData darkTheme = ThemeData.dark();

  // Singleton instance
  static final ThemePreferences _singleton = ThemePreferences._internal();

  // Factory constructor
  factory ThemePreferences() {
    return _singleton;
  }

  // Private constructor
  ThemePreferences._internal();

  switchTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool currentTheme = prefs.getBool(THEME_STATUS) ?? false;
    prefs.setBool(THEME_STATUS, !currentTheme);
  }

  isDarkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }

  Future<ThemeData> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false ? darkTheme : lightTheme;
  }
}
