import 'package:flutter/material.dart';
import 'package:news_app/src/app.dart';
import 'package:news_app/src/services/news_api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await dotenv.load(fileName: ".env");

  final apiController = NewsApiService();

  runApp(MyApp(apiController));
}
