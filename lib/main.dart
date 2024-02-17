import 'package:flutter/material.dart';
import 'package:news_app/src/services/news_api_service.dart';
import 'package:news_app/src/views/screens/home_screen.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.

  final apiController = NewsApiService();
  var news = await apiController.getNews();
  for (var i = 0; i < 10; i++) {
    print(news[i].title);
  }

  runApp(HomePage(news));
}
