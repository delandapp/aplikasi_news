import 'package:dicoding_news_app/class/article.dart';
import 'package:dicoding_news_app/pages/news_detail_page.dart';
import 'package:dicoding_news_app/pages/news_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {  
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/newslist',
      routes: {
        NewsListPage.routeName: (context) => const NewsListPage(),
        ArticleDetailPage.routeName: (context) => ArticleDetailPage(article: ModalRoute.of(context)?.settings.arguments as Article,),
      },
    );
  }
}
