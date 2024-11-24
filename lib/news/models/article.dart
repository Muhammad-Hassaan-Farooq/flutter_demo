
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'source.dart';
part 'article.g.dart';

@JsonSerializable()
class Article extends Equatable{
  final Source source;
  final String author;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime? publishedAt;
  final String content;
  final String title;

  const Article({
    required this.source,
    required this.author,
    required this.description,
    required this.url,
    required this.urlToImage,
    this.publishedAt,
    required this.content,
    required this.title
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String,dynamic> toJson() => _$ArticleToJson(this);
  @override
  List<Object?> get props => [source,author,description,url,urlToImage,publishedAt,content,title];

}