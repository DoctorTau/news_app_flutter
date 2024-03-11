import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_article.dart';
import 'package:news_app/src/services/news_api_service.dart';
import 'package:news_app/src/settings/theme_preferences.dart';
import 'package:news_app/src/views/screens/home_screen.dart';

class MyApp extends StatefulWidget {
  final NewsApiService apiController;

  const MyApp(this.apiController, {super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemePreferences themePreferences = ThemePreferences();
  ThemeData currentTheme = ThemeData();

  @override
  void initState() {
    super.initState();
    _getTheme();
  }

  void _getTheme() async {
    currentTheme = await themePreferences.getTheme();
    setState(() {});
  }

  void _toggleTheme() async {
    await themePreferences.switchTheme();
    _getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: currentTheme,
      home: FutureBuilder(
        future: widget.apiController.getNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomeScreen(snapshot.data as List<News>,
                toggleTheme: _toggleTheme);
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
