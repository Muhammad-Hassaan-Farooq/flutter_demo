
import 'package:json_annotation/json_annotation.dart';
import 'source.dart';
part 'article.g.dart';

@JsonSerializable()
class Article {
  final Source source;
  final String author;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  const Article({
    required this.source,
    required this.author,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content
});

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

}