import 'package:flutter/material.dart';
import 'package:flutter_demo/news/models/article.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class ArticleList extends StatelessWidget {
  final List<Article> articles;

  const ArticleList({required this.articles, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ArticleTile(article: articles[index]);
        });
  }
}

class ArticleTile extends StatelessWidget {
  final Article article;
  const ArticleTile({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Card(
        child: InkWell(
            onTap: () {
              _settingModalBottomSheet(context, article);
            },
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              title: Text(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  article.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.source.name),
                  Text(
                    article.publishedAt?.toUtc().toString() ??
                        'No Date Available',
                  )
                ],
              ),
              leading: Stack(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.white,
                    ),
                  ),
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: article.urlToImage,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(milliseconds: 500),
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Container(
                      height: 100,
                      width: 100,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

void _settingModalBottomSheet(context, Article article) {

  final screenWidth = MediaQuery.of(context).size.width;

  showModalBottomSheet(
      enableDrag: true,
      showDragHandle: true,
      context: context,
      builder: (BuildContext bc) {
        return Padding(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: [
                    Text(
                        style: const TextStyle(
                            fontWeight: FontWeight.bold
                            ,fontSize: 20),
                        article.title),
                    Text("By ${article.source.name}"),
                    Text("Published on ${article.publishedAt.toString()}"),
                    Stack(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 0.9*screenWidth,
                            color: Colors.white,
                          ),
                        ),
                        FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: article.urlToImage,

                          fit: BoxFit.fitWidth,
                          fadeInDuration: const Duration(milliseconds: 500),
                          imageErrorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: Colors.grey[300],
                                child: const Icon(
                                  Icons.broken_image,
                                  color: Colors.grey,
                                ),
                              ),
                        ),
                      ],
                    ),
                    Text(
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        article.description),
                    Text(article.content),
              ],
            ));
      });
}
