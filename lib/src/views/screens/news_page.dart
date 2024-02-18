import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_article.dart';
import 'package:url_launcher/link.dart';

class NewsPage extends StatelessWidget {
  final News news;
  const NewsPage(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _NewsImage(news.urlToImage),
            _NewsTitle(news.title),
            _NewsDescription(news.description),
            _NewsUrl(news.url),
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
        textAlign: TextAlign.left);
  }
}

class _NewsDescription extends StatelessWidget {
  final String description;
  const _NewsDescription(this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(description, style: const TextStyle(fontSize: 16));
  }
}

class _NewsUrl extends StatelessWidget {
  final String url;
  const _NewsUrl(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Link(
        target: LinkTarget.blank,
        uri: Uri.parse(url),
        builder: (context, followLink) => TextButton(
              onPressed: followLink,
              child: const Text('Read more'),
            ));
  }
}
