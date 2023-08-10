import 'package:flutter/material.dart';
import 'package:loudnews/models/news_model.dart';
import 'package:loudnews/views/components/news_details_screen/news_details_body_section.dart';

import '../components/news_details_screen/news_details_appbar_section.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsArticles newsItem;

  const NewsDetailsScreen({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                NewsDetailsAppBarSection(newsItem: newsItem),
                NewsDetailsBodySection(newsItem: newsItem)
              ],
            ),
          ),
          Positioned(
              child: SizedBox(
            height: size.height,
            width: size.width,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                    Colors.white,
                    Colors.white.withOpacity(0),
                  ])),
            ),
          ))
        ],
      ),
    );
  }
}
