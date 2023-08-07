import 'package:flutter/material.dart';
import 'package:loudnews/models/news_item.dart';

class NewsDetailsBodySection extends StatefulWidget {
  final NewsItem newsItem;

  const NewsDetailsBodySection({super.key, required this.newsItem});

  @override
  State<NewsDetailsBodySection> createState() => _NewsDetailsBodySectionState();
}

class _NewsDetailsBodySectionState extends State<NewsDetailsBodySection> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundImage: NetworkImage(widget.newsItem.imgUrl)),
                const SizedBox(width: 8.0),
                Text(widget.newsItem.author,
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 18.0),
            Text(widget.newsItem.title,
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
