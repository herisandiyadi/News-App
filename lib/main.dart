import 'package:flutter/material.dart';
import 'package:newsapp/data/model/article.dart';
import 'package:newsapp/ui/article_webview_page.dart';
import 'package:newsapp/common/style.dart';
import 'package:newsapp/ui/detail_page.dart';
import 'package:newsapp/ui/home_page.dart';

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
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor,
            ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: secondaryColor,
          unselectedItemColor: Colors.grey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: secondaryColor,
            onPrimary: Colors.white,
            textStyle: TextStyle(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
          ),
        ),
        textTheme: myTextTheme,
        appBarTheme: AppBarTheme(elevation: 0),
      ),
      routes: {
        '/': (context) => HomePage(),
        '/detail-page': (context) => ArticleDetailPage(
            article: ModalRoute.of(context)?.settings.arguments as Article),
        '/article-webview': (context) => ArticleWebView(
              url: ModalRoute.of(context)?.settings.arguments as String,
            ),
      },
    );
  }
}
