import 'package:flutter/material.dart';
import 'package:loudnews/models/news_item.dart';
import 'package:loudnews/views/widgets/recommendation_item.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: news.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 5),
              child: index == news.length - 1
                  ? Column(
                      children: [
                        RecommendationItem(newsItem: news[index]),
                        const SizedBox(height: 25),
                      ],
                    )
                  : RecommendationItem(newsItem: news[index]),
            );
          }),
    );
  }
}
