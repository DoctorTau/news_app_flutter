import 'package:flutter/material.dart';
import 'package:news_app/src/app.dart';
import 'package:news_app/src/services/news_api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final apiController = NewsApiService();

  runApp(MyApp(apiController));
}
