import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:news_app/src/models/news_article.dart';
import 'package:http/http.dart' as http;

class NewsApiService {
  final String apiKey = dotenv.env['API_KEY']!;
  final String newsTheme = 'Satoru Gojo';
  final String _baseUrl = 'https://newsapi.org/v2/everything';

  // Replace null values with empty strings
  dynamic replaceNullWithEmptyString(dynamic value) {
    if (value is Map<String, dynamic>) {
      return value.map(
          (key, value) => MapEntry(key, replaceNullWithEmptyString(value)));
    } else if (value is List<dynamic>) {
      return value.map(replaceNullWithEmptyString).toList();
    } else if (value == null) {
      return '';
    } else {
      return value;
    }
  }

  Future<List<News>> getNews() async {
    final response = await http.get(
      Uri.parse('$_baseUrl?q=$newsTheme&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var sanitizedJson = replaceNullWithEmptyString(json);
      Iterable list = sanitizedJson['articles'];
      return list.map((article) => News.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
