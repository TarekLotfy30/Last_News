class NewsModel {
  String? status;
  int? totalResults;
  List<Articles>? articles = [];

  NewsModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      json['articles'].forEach(
        (element) {
          if (element['title'] !=
              "[Removed]") //&&element['urlToImage'] != null)
          {
            articles?.add(
              Articles.fromJson(element),
            );
          }
        },
      );
    }
  }
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Articles.fromJson(Map<String, dynamic> json) {
    source = Source.fromJson(json['source'] ?? {});
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
