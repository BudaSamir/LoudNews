import 'package:flutter/material.dart';
import 'package:loudnews/models/news_model.dart';
import 'package:loudnews/views/widgets/appbar_icon.dart';

class NewsDetailsAppBarSection extends StatefulWidget {
  final NewsArticles newsItem;

  const NewsDetailsAppBarSection({super.key, required this.newsItem});

  @override
  State<NewsDetailsAppBarSection> createState() =>
      _NewsDetailsAppBarSectionState();
}

class _NewsDetailsAppBarSectionState extends State<NewsDetailsAppBarSection> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      expandedHeight: size.height * 0.4,
      iconTheme: const IconThemeData(color: Colors.white),
      leading: AppBarIcon(
        icon: Icons.chevron_left,
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        AppBarIcon(
          icon: Icons.bookmark_border,
          onPressed: () => Navigator.of(context).pop(),
        ),
        AppBarIcon(
          icon: Icons.more_horiz,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
        background: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                widget.newsItem.urlToImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
                child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.15)),
            )),
            Positioned(
              left: 16,
              bottom: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.newsItem.source.name,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(widget.newsItem.title,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                  const SizedBox(height: 8.0),
                  Text(
                    '${widget.newsItem.author} • ${widget.newsItem.title}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: SizedBox(
          height: 30,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(36.0))),
          ),
        ),
      ),
    );
  }
}
