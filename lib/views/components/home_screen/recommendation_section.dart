import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loudnews/models/news_item.dart';
import 'package:loudnews/viewmodels/cubits/news_cubit/news_cubit.dart';
import 'package:loudnews/views/widgets/recommendation_item.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
        if (state is SuccessFetchNews) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.newsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 5),
                  child: index == news.length - 1
                      ? Column(
                          children: [
                            RecommendationItem(newsItem: state.newsList[index]),
                            const SizedBox(height: 25),
                          ],
                        )
                      : RecommendationItem(newsItem: state.newsList[index]),
                );
              });
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}
