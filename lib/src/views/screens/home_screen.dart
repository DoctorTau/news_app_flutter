import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_article.dart';
import 'package:news_app/src/views/widgets/news_tile.dart';

class HomePage extends StatefulWidget {
  final List<News> news;
  const HomePage(this.news, {super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('News App'),
        ),
        body: ListView.builder(
          itemCount: widget.news.length,
          itemBuilder: (context, index) {
            return NewsTile(widget.news[index]);
          },
        ),
      ),
    );
  }
}
