import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:news_repository/news_repository.dart' hide Article,Source;
import 'package:equatable/equatable.dart';
import 'package:flutter_demo/news/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_state.dart';
part 'news_cubit.g.dart';

class NewsCubit extends HydratedCubit<NewsState>{

  final NewsRepository _newsRepository;

  NewsCubit(this._newsRepository):super(NewsState(status: NewsStatus.loading));

  Future<void> fetchNews() async{
    emit(state.copyWith(status: NewsStatus.loading));

    try{

      final articles = await _newsRepository.getNews();

      emit(state.copyWith(
        status: NewsStatus.success,
        articles: articles as List<Article>?
      ));
    }
    catch(e,stackTrace){
      print('Caught error: $e');
      print('Stack trace: $stackTrace');
      emit(state.copyWith(
        status: NewsStatus.error
      ));
    }
  }

  @override
  NewsState fromJson(Map<String, dynamic> json) => NewsState.fromJson(json);

  @override
  Map<String, dynamic> toJson(NewsState state) => state.toJson();
}