import 'package:flutter/material.dart';
import 'package:loudnews/models/news_item.dart';

class RecommendationItem extends StatelessWidget {
  final NewsItem newsItem;

  const RecommendationItem({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.network(
            newsItem.imgUrl,
            height: 120,
            width: 140,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                newsItem.category,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.grey,
                    ),
              ),
              Text(
                newsItem.title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                '${newsItem.author} • ${newsItem.time}',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.grey,
                    ),
              )
            ],
          ),
        )
      ],
    );
  }
}
