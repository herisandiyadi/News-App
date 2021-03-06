import 'package:flutter/material.dart';
import 'package:newsapp/data/model/article.dart';

class ArticleDetailPage extends StatelessWidget {
  // static const routeName = '/article_detail';
  final Article article;

  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.network(article.urlToImage!),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(article.description!),
                Divider(
                  color: Colors.grey,
                ),
                Text(
                  article.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Text('Date : ${article.publishedAt}'),
                SizedBox(
                  height: 10,
                ),
                Text('Author : ${article.author}'),
                Divider(
                  color: Colors.grey,
                ),
                Text(
                  article.content!,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/article-webview',
                        arguments: article.url);
                  },
                  child: Text('Read more'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
