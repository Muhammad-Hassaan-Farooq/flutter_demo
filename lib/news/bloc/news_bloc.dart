import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_demo/news/models/models.dart';
import 'package:news_repository/news_repository.dart' hide Article,Source;

part 'news_state.dart';
part 'news_event.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository;
  NewsBloc({NewsRepository? newsRepository})
      : _newsRepository = newsRepository ?? NewsRepository(),
        super(const NewsLoading()) {
    on<FetchNews>(_fetchNews);
  }

  void _fetchNews(FetchNews event, Emitter<NewsState> emit) async {
    emit(const NewsLoading());
    try{
      final articles = await _newsRepository.getNews();
      final articlesList = articles.map((article)=>
        Article(
          source: Source(id: article.source.id, name: article.source.name),
          author: article.author,
          description: article.description,
          url: article.url,
          urlToImage: article.urlToImage,
          publishedAt: article.publishedAt,
          content: article.content
        )
      ).toList();
      emit(NewsLoaded(articles: articlesList));
    }
    catch(e,stack){
        emit(const NewsError());
    }
  }
}
