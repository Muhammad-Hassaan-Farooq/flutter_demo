import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api/src/models/models.dart';

class NewsRequestFailure implements Exception {}

class NewsApiClient {
  final http.Client _httpClient;
  static const _baseurl = "newsapi.org";

  NewsApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();


  Future<List<Article>> getArticles() async{

    final articleRequest = Uri.https(
      _baseurl,
        "/v2/top-headlines",
        {'country':"us","apiKey":"047fa4da788540e08f429c7bf26ec470"}
    );

    final articleResponse = await _httpClient.get(articleRequest);

    if(articleResponse.statusCode != 200){
      throw NewsRequestFailure();
    }

    final articleJson = jsonDecode(articleResponse.body) as Map;
    final results = articleJson["articles"] as List;



    return results
        .map((article)=>Article.fromJson(article as Map<String,dynamic>))
        .toList();
  }




}
