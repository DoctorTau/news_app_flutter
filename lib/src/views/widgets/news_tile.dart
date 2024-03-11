import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/models/news_article.dart';
import 'package:news_app/src/services/favourite_article_notifier.dart';
import 'package:news_app/src/views/screens/news_page.dart';

class NewsTile extends StatelessWidget {
  final News news;

  const NewsTile(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NewsScreen(news);
        }));
      },
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).cardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _NewsImage(news.urlToImage),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: _NewsTitle(news.title)),
                  _FavoriteButton(news)
                ],
              ),
              _NewsDescription(news.description),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewsImage extends StatelessWidget {
  final String imageUrl;
  const _NewsImage(this.imageUrl);

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
  const _NewsTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        textAlign: TextAlign.left);
  }
}

class _NewsDescription extends StatelessWidget {
  final String description;
  const _NewsDescription(this.description);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 12, 16, 12),
      child: Text(
        description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  final News news;
  const _FavoriteButton(this.news);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final isFavorite = ref.watch(favoriteArticlesProvider).contains(news);
      return IconButton(
        icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
        color: Colors.red[700],
        onPressed: () {
          isFavorite
              ? ref.read(favoriteArticlesProvider.notifier).removeFavorite(news)
              : ref.read(favoriteArticlesProvider.notifier).addFavorite(news);
        },
      );
    });
  }
}
