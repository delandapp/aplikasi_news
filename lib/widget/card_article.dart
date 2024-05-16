import 'package:dicoding_news_app/data/models/response_news.dart';
import 'package:dicoding_news_app/pages/news_detail_page.dart';
import 'package:dicoding_news_app/style.dart';
import 'package:flutter/material.dart';

class CardArticle extends StatelessWidget {
  final Article? article;
 
  const CardArticle({super.key, required this.article});
 
  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: article!.urlToImage!,
          child: Image.network(
            article!.urlToImage!,
            width: 100,
          ),
        ),
        title: Text(
          article!.title,
        ),
        subtitle: Text(article!.author!),
        onTap: () => Navigator.pushNamed(
          context,
          ArticleDetailPage.routeName,
          arguments: article,
        ),
      ),
    );
  }
}