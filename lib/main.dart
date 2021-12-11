import 'package:flutter/material.dart';
import 'package:newsapp/article.dart';
import 'package:newsapp/detail_page.dart';
import 'package:newsapp/newslist_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => NewsListPage(),
        '/detail-page': (context) => ArticleDetailPage(
            article: ModalRoute.of(context)?.settings.arguments as Article),
      },
    );
  }
}
