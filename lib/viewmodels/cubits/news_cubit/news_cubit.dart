import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loudnews/models/news_model.dart';
import 'package:loudnews/viewmodels/database/network/dio_exceptions.dart';
import 'package:loudnews/viewmodels/database/network/dio_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context, listen: true);

  Future<void> fetchHeadLinesNews() async {
    emit(LoadingFetchNews());
    print('loading');
    await DioHelper()
        .getData(
            url:
                'https://newsapi.org/v2/top-headlines?country=us&apiKey=6ceae27e857a413ca1f1d6f59374df77')
        .then((response) {
      News news = News.fromJson(response.data);
      List<NewsArticles> newsList = news.newsArticles
          .map((newsArticle) => NewsArticles.fromJson(newsArticle))
          .toList();
      print('success');
      emit(SuccessFetchNews(newsList));
    }).catchError((onError) {
      print('error');
      if (onError is DioException) {
        final errorMessage = DioExceptions.fromDioException(onError).toString();
        print(errorMessage);
        emit(FailedFetchNews(errorMessage));
      }
      print(onError);
    });
  }
}
