part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class LoadingFetchNewsByCategory extends CategoriesState {}

class SuccessFetchNewsByCategory extends CategoriesState {
  final List<NewsArticles> newsList;

  SuccessFetchNewsByCategory(this.newsList);
}

class FailedFetchNewsByCategory extends CategoriesState {
  final String error;

  FailedFetchNewsByCategory(this.error);
}

class SetCategoryState extends CategoriesState {}
