import 'package:flutter/material.dart';
import 'package:loudnews/models/news_item.dart';

import '../components/news_details_screen/news_details_appbar_section.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsItem newsItem;

  const NewsDetailsScreen({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [NewsDetailsAppBarSection(newsItem: newsItem)],
            )
          ],
        ),
      ),
    );
  }
}
