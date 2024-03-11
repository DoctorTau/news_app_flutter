import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/views/widgets/news_tile.dart';
import 'package:news_app/src/services/favourite_article_notifier.dart'; // Update with the correct path

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteArticles = ref.watch(favoriteArticlesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Articles'),
      ),
      body: favoriteArticles.isEmpty
          ? const Center(
              child: Text('No favorite articles added.'),
            )
          : ListView.builder(
              itemCount: favoriteArticles.length,
              itemBuilder: (context, index) {
                final article = favoriteArticles[index];
                return NewsTile(article);
              },
            ),
    );
  }
}
