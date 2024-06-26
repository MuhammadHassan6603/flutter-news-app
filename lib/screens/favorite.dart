import 'package:flutter/material.dart';
import '../view_model/article_view_model.dart';
import 'article_details_screen.dart';

class FavoritesScreen extends StatefulWidget {
  static List<ArticleViewModel> favorites = [];

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: FavoritesScreen.favorites.length,
        itemBuilder: (context, index) {
          var news = FavoritesScreen.favorites[index];
          return ListTile(
            title: Text(news.title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetailsScreen(
                          title: news.title,
                          author: news.author,
                          publishedAt: news.publishedAt,
                          description: news.description,
                          content: news.content,
                          urlToImage: news.urlToImage,
                          url: news.url,
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      FavoritesScreen.favorites.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
