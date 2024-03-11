import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_article.dart';
import 'package:news_app/src/views/screens/favorites_screen.dart';
import 'package:news_app/src/views/widgets/news_tile.dart';

class HomeScreen extends StatefulWidget {
  final List<News> news;
  final VoidCallback toggleTheme;
  const HomeScreen(this.news, {required this.toggleTheme, super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _MainAppBar(widget: widget),
      body: ListView.builder(
        itemCount: widget.news.length,
        itemBuilder: (context, index) {
          return NewsTile(widget.news[index]);
        },
      ),
    );
  }
}

class _MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MainAppBar({
    required this.widget,
  });

  final HomeScreen widget;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('News App'),
      actions: [
        IconButton(
          icon: const Icon(Icons.brightness_4),
          onPressed: () {
            widget.toggleTheme();
          },
        ),
        IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FavoritesScreen()),
            );
          },
        ),
      ],
    );
  }
}
