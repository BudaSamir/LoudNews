import 'package:flutter/material.dart';
import 'package:loudnews/models/news_item.dart';
import 'package:loudnews/views/components/home_screen/appbar_section.dart';
import 'package:loudnews/views/components/home_screen/headlines_section.dart';
import 'package:loudnews/views/widgets/home_title.dart';

import '../widgets/recommendation_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppBarSection(),
              const HomeTitle(title: 'Breaking News'),
              const HeadlinesSection(),
              const HomeTitle(title: 'Recommendation'),
              ...news
                  .map((newsItem) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 3),
                        child: RecommendationItem(newsItem: newsItem),
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
