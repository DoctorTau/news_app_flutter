import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/news_article.dart';
import 'package:http/http.dart' as http;

class NewsApiService {
  final String apiKey = dotenv.env['API_KEY']!;
  final String newsTheme = 'Satoru Gojo';
  final String _baseUrl = 'https://newsapi.org/v2/everything';

  Future<List<News>> getNews() async {
    final response = await http.get(
      Uri.parse('$_baseUrl?q=$newsTheme&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article) => News.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
