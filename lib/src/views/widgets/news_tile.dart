import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_article.dart';

class NewsTile extends StatelessWidget {
  final News news;

  const NewsTile(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _NewsImage(news.urlToImage),
            _NewsTitle(news.title),
            _NewsDescription(news.description),
          ],
        ),
      ),
    );
  }
}

class _NewsImage extends StatelessWidget {
  final String imageUrl;
  const _NewsImage(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Image.network(
        imageUrl,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          // You can return an error image or a placeholder here
          return Image.asset('assets/images/news-placeholder.png');
        },
      ),
    );
  }
}

class _NewsTitle extends StatelessWidget {
  final String title;
  const _NewsTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        textAlign: TextAlign.center);
  }
}

class _NewsDescription extends StatelessWidget {
  final String description;
  const _NewsDescription(this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 16, 12),
      child: Text(description),
    );
  }
}
