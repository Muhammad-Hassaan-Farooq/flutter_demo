part of 'news_bloc.dart';

sealed class NewsEvent{
  const NewsEvent();
}

final class FetchNews extends NewsEvent{
  const FetchNews();
}
