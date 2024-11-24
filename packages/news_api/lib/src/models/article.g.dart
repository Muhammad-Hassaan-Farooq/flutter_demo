// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Article',
      json,
      ($checkedConvert) {
        final val = Article(
          source: $checkedConvert(
              'source', (v) => Source.fromJson(v as Map<String, dynamic>)),
          author: $checkedConvert(
              'author', (v) => v as String? ?? "Unknown Author"),
          description: $checkedConvert(
              'description', (v) => v as String? ?? "No description available"),
          url: $checkedConvert('url', (v) => v as String),
          urlToImage:
              $checkedConvert('urlToImage', (v) => v as String? ?? ""),
          publishedAt: $checkedConvert('publishedAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          content: $checkedConvert(
              'content', (v) => v as String? ?? "No content available"),
          title: $checkedConvert('title', (v) => v as String? ?? "Removed"),
        );
        return val;
      },
      fieldKeyMap: const {
        'urlToImage': 'url_to_image',
        'publishedAt': 'published_at'
      },
    );
