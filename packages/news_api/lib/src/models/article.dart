
import 'package:json_annotation/json_annotation.dart';
import 'source.dart';
part 'article.g.dart';

@JsonSerializable()
class Article {
  final Source source;
  final String? author;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  const Article({
    required this.source,
    this.author = "Unknown Author", // Default value
    this.description = "No description available", // Default value
    required this.url, // URL is kept required
    this.urlToImage = "", // Default value for optional image URL
    this.publishedAt, // DateTime can remain null without default
    this.content = "No content available", // Default value
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  @override
  String toString() {
    return 'Article{source: $source, author: $author, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content}';
  }

}