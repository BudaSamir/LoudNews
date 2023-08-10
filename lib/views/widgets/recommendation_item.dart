import 'package:flutter/material.dart';
import 'package:loudnews/models/news_model.dart';
import 'package:loudnews/views/screens/news_details_screen.dart';

class RecommendationItem extends StatelessWidget {
  final NewsArticles newsItem;

  const RecommendationItem({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
        builder: (context) => NewsDetailsScreen(
          newsItem: newsItem,
        ),
      )),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              newsItem.urlToImage,
              height: 120,
              width: 140,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsItem.source.name,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  newsItem.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  '${newsItem.author} • ${newsItem.publishedAt}',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey,
                      ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
