part of 'news_cubit.dart';


enum NewsStatus {loading,success,error}

extension NewsStatusX on NewsStatus{

  bool get isLoading => this == NewsStatus.loading;
  bool get isError => this == NewsStatus.error;
  bool get isSuccess => this == NewsStatus.success;

}

@JsonSerializable()
final class NewsState extends Equatable{

  final NewsStatus status;
  final List<Article> articles;

  NewsState({
    this.status = NewsStatus.loading,
    List<Article>? articles
    }):articles = articles?? [];

  NewsState copyWith({
    NewsStatus? status,
    List<Article>? articles
}){
    return NewsState(status: status??this.status, articles: articles??this.articles);
  }

  Map<String,dynamic> toJson() => _$NewsStateToJson(this);

  factory NewsState.fromJson(Map<String, dynamic> json) =>
  _$NewsStateFromJson(json);

  @override
  List<Object?> get props => [status,articles];


}