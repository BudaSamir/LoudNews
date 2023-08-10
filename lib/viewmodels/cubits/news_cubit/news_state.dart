part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class LoadingFetchNews extends NewsState {}

class SuccessFetchNews extends NewsState {
  final List<NewsArticles> newsList;

  SuccessFetchNews(this.newsList);
}

class FailedFetchNews extends NewsState {
  final String error;

  FailedFetchNews(this.error);
}
