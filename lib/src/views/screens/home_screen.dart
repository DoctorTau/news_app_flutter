import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_article.dart';
import 'package:news_app/src/views/widgets/news_tile.dart';

class HomePage extends StatefulWidget {
  final List<News> news;
  final VoidCallback toggleTheme;
  const HomePage(this.news, {required this.toggleTheme, super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4),
            onPressed: () {
              widget.toggleTheme();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.news.length,
        itemBuilder: (context, index) {
          return NewsTile(widget.news[index]);
        },
      ),
    );
  }
}
