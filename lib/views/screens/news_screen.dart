import 'package:flutter/material.dart';
import 'package:loudnews/views/components/home_screen/news_section.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0),
          child: NewsSection(false),
        ),
      ),
    );
  }
}
