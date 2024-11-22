import 'package:news_api/news_api.dart' hide Article,Source;
import 'package:news_repository/news_repository.dart';

class NewsRepository {
  final NewsApiClient _newsApiClient;

  NewsRepository({NewsApiClient? newsApiClient})
      : _newsApiClient = newsApiClient ?? NewsApiClient();

  Future<List<Article>> getNews() async {
    final news = await _newsApiClient.getArticles() as List;



    return news
        .map((article) => Article(
            source: Source(id:article.source.id,name:article.source.name),
            author: article.author,
            description: article.description,
            url: article.url,
            urlToImage: article.urlToImage,
            publishedAt: article.publishedAt,
            content: article.content))
        .toList();
  }
}
