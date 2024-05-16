import 'package:dicoding_news_app/class/api.dart';
import 'package:dicoding_news_app/data/models/response_news.dart';
import 'package:dicoding_news_app/pages/news_detail_page.dart';
import 'package:dicoding_news_app/widget/card_article.dart';
import 'package:flutter/material.dart';

class NewsListPage extends StatefulWidget {
  static const routeName = '/article_list';

  const NewsListPage({super.key});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  late Future<ArticlesResult> _article;

  @override
  void initState() {
    super.initState();
    _article = ApiService().topHeadlines();
  }

  Widget _buildList(BuildContext context) {
    return FutureBuilder<ArticlesResult>(
      future: _article,
      builder: (context, AsyncSnapshot<ArticlesResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.articles.length,
              itemBuilder: (context, index) {
                Article article = snapshot.data?.articles[index] as Article;
                return CardArticle(article: article);
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Material(
                child: Text(snapshot.error.toString()),
              ),
            );
          } else {
            return const Material(child: Text(''));
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News App',
        ),
      ),
      body: _buildList(context)
      // FutureBuilder<String>(
      //   future: DefaultAssetBundle.of(context)
      //       .loadString('assets/json/berita.json'),
      //   builder: (context, snapshot) {
      //     final List<Article> articles = parseArticles(snapshot.data);
      //     return ListView.builder(
      //       itemCount: articles.length,
      //       itemBuilder: (context, index) {
      //         return _buildArticleItem(context, articles[index]);
      //       },
      //     );
      //   },
      // ),
    );
  }

  Widget _buildArticleItem(BuildContext context, Article article) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Hero(
        tag: article.urlToImage!,
        child: Image.network(
          article.urlToImage!,
          width: 100,
        ),
      ),
      title: Text(
        article.title,
      ),
      subtitle: Text(article.author!),
      onTap: () {
        Navigator.pushNamed(context, ArticleDetailPage.routeName,
            arguments: article);
      },
    );
  }
}
