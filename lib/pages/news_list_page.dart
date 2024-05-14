import 'package:dicoding_news_app/class/article.dart';
import 'package:dicoding_news_app/pages/news_detail_page.dart';
import 'package:dicoding_news_app/widget/buildArticle.dart';
import 'package:flutter/material.dart';

class NewsListPage extends StatelessWidget {
  static const routeName = '/newslist';
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      //* future yang berisi objek Future yang akan ditampilkan lalu parameter builderuntuk menjalankan suatu proses ketika nilai Future telah didapatkan.Karena Future kita mengembalikan String, maka kita perlu mengonversinya menjadi objek yang kita siapkan. Proses konversi ini juga dikenal dengan json parsing. Mari buat fungsi baru di dalam berkas article.dart.
      body: FutureBuilder<String>(
        future:
            // * DefaultAssetBundle pada dasarnya juga merupakan sebuah widget. Widget ini akan membaca String dari berkas aset yang kita tentukan.
            DefaultAssetBundle.of(context)
                .loadString('assets/json/berita.json'),
        builder: (context, snapshot) {
          final List<Article> articles = parseArticles(snapshot.data);
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                print(articles[index]);
                return GestureDetector(onTap: () {
                  Navigator.pushNamed(context, ArticleDetailPage.routeName,arguments: articles[index]);
                },child: buildArticleItem(context, articles[index]));
              },
            ),
          );
        },
      ),
    );
  }
}
