class ArticlesResult {
  ArticlesResult({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int totalResults;
  final List<Article> articles;

  // !  Jika Anda perhatikan data yang dikembalikan dari API, akan ada beberapa data yang tidak lengkap dan bernilai null. Apabila data ini tidak lengkap, kita bisa memfilternya saja agar tidak ditampilkan dalam aplikasi. Pada factory method, tambahkan fungsi whereuntuk menyaring property tertentu yang tidak boleh null.

  factory ArticlesResult.fromJson(Map<String, dynamic> json) => ArticlesResult(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"]
            .map((x) => Article.fromJson(x))
            .where((article) =>
                article.author != null &&
                article.title != null &&
                article.description != null &&
                article.url != null &&
                article.urlToImage != null &&
                article.publishedAt != null &&
                article.content != null)),
      );
}

class Article {
  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );
}
