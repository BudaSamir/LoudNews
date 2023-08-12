class News {
  String status;
  int totalResults;
  List<dynamic> newsArticles;

  News(
      {required this.status,
      required this.totalResults,
      required this.newsArticles});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      status: json['status'],
      totalResults: json['totalResults'],
      newsArticles: json['articles'],
    );
  }
}

class NewsArticles {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  NewsArticles({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsArticles.fromJson(Map<String, dynamic> json) {
    return NewsArticles(
        source: Source.fromJson(json['source']),
        author: json['author'] ?? 'null',
        title: json['title'] ?? 'null',
        description: json['description'] ?? 'null',
        url: json['url'] ?? 'null',
        urlToImage: json['urlToImage'] ??
            "https://techcrunch.com/wp-content/uploads/2022/01/locket-app.jpg?w=1390&crop=1",
        publishedAt: json['publishedAt'] ?? 'null',
        content: json['content'] ?? 'null');
  }
}

class Source {
  String? id;
  String name;
  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'] ?? 'null', name: json['name']);
  }
}
