import 'dart:convert';

import '../models/news_article.dart';
import 'package:http/http.dart' as http;

class NewsApiService {
  final String apiKey = '4e71a60c8206407c89f52b30c17279fd';
  final String newsTheme = 'flutter';
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
