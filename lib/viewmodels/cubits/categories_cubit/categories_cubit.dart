import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loudnews/models/news_model.dart';
import 'package:loudnews/viewmodels/database/network/dio_exceptions.dart';
import 'package:loudnews/viewmodels/database/network/dio_helper.dart';
import 'package:loudnews/viewmodels/database/network/end_points.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  static CategoriesCubit get(context) =>
      BlocProvider.of(context, listen: false);

  String category = '';
  int articleCounts = 0;

  setCategory(String cate) {
    category = cate;
    emit(SetCategoryState());
  }

  Future<void> fetchHeadLinesNewsByCategory() async {
    print("category = $category");
    emit(LoadingFetchNewsByCategory());
    print('loading');
    await DioHelper()
        .getData(
            url: '$topHeadlines?country=us&category=$category&apiKey=$apiKey')
        .then((response) {
      News news = News.fromJson(response.data);
      List<NewsArticles> newsList = news.newsArticles
          .map((newsArticle) => NewsArticles.fromJson(newsArticle))
          .toList();
      print('success');
      emit(SuccessFetchNewsByCategory(newsList));
    }).catchError((onError) {
      print('error');
      if (onError is DioException) {
        final errorMessage = DioExceptions.fromDioException(onError).toString();
        print(errorMessage);
        emit(FailedFetchNewsByCategory(errorMessage));
      }
      print(onError);
    });
  }
}
