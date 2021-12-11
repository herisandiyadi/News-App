import 'package:flutter/material.dart';
import 'package:newsapp/article.dart';
import 'package:newsapp/detail_page.dart';

class NewsListPage extends StatelessWidget {
  // static const routeName = '/articlelist';
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildArticleItem(BuildContext context, Article article) {
      return ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/detail-page', arguments: article);
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Image.network(
          article.urlToImage,
          width: 100,
        ),
        title: Text(article.title),
        subtitle: Text(article.author),
      );
    }

    return Scaffold(
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/source/articles.json'),
        builder: (context, snapshot) {
          final List<Article> articles = parseArticles(snapshot.data);
          return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return _buildArticleItem(context, articles[index]);
              });
        },
      ),
    );
  }
}
