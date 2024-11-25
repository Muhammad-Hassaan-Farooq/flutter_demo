import 'package:flutter/material.dart';
import 'package:flutter_demo/news/models/article.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

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
      padding: const EdgeInsets.all(4),
      child: Card(
        color: Colors.white,
        elevation: 3,
        shadowColor: Colors.orange,
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
                  Text(article.author),
                  Text(DateFormat("yyyy-MM-dd")
                      .format(DateTime.parse(article.publishedAt.toString())))
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
      isScrollControlled: true,
      enableDrag: true,
      showDragHandle: true,
      context: context,
      builder: (BuildContext bc) {
        return Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      article.title),
                  const SizedBox(height: 10),
                  Text("By ${article.author}"),
                  Text(
                      "Published on ${DateFormat("yyyy-MM-dd").format(DateTime.parse(article.publishedAt.toString()))}"),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 0.9 * screenWidth,
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
                  ),
                  const SizedBox(height: 10),
                  Text(
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      article.description),
                  const SizedBox(height: 10),
                  Text(article.content),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () async {
                        try {
                          if (!await launchUrl(Uri.parse(article.url))) {
                            throw Exception("Error opening url");
                          }
                        } catch (e) {
                          Fluttertoast.showToast(
                              msg: "Could not open article",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
                      child: const Text(
                          style: TextStyle(
                            color: Colors.white
                          )
                          ,"View article"))
                ],
              ),
            ));
      });
}
