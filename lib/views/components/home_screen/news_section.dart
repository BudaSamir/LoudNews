import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loudnews/viewmodels/cubits/news_cubit/news_cubit.dart';
import 'package:loudnews/views/widgets/recommendation_item.dart';

import '../../../viewmodels/cubits/categories_cubit/categories_cubit.dart';

class NewsSection extends StatelessWidget {
  bool isHomeScreen = true;

  NewsSection(this.isHomeScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    var categoriesCubit = CategoriesCubit.get(context);
    if (isHomeScreen == false) {
      categoriesCubit.fetchHeadLinesNewsByCategory();
    }
    return SizedBox(
      height: isHomeScreen ? 500 : double.infinity,
      width: double.infinity,
      child: isHomeScreen
          ? BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
              if (state is SuccessFetchNews) {
                return article(state);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            })
          : BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
              if (state is SuccessFetchNewsByCategory) {
                return article(state);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
    );
  }

  ListView article(state) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.newsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 5),
            child: index == state.newsList.length - 1
                ? Column(
                    children: [
                      RecommendationItem(newsItem: state.newsList[index]),
                      SizedBox(height: isHomeScreen ? 30 : 50),
                    ],
                  )
                : RecommendationItem(newsItem: state.newsList[index]),
          );
        });
  }
}
