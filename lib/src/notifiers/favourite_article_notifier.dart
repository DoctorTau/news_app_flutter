import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/models/news_article.dart';

class FavoriteArticlesNotifier extends StateNotifier<List<News>> {
  FavoriteArticlesNotifier() : super([]);

  void addFavorite(News article) {
    state = [...state, article];
  }

  void removeFavorite(News article) {
    state = state.where((item) => item.url != article.url).toList();
  }

  bool isFavorite(News article) {
    return state.any((item) => item.url == article.url);
  }
}

final favoriteArticlesProvider =
    StateNotifierProvider<FavoriteArticlesNotifier, List<News>>((ref) {
  return FavoriteArticlesNotifier();
});
