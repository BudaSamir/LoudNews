import 'package:flutter/material.dart';
import 'package:loudnews/views/components/home_screen/appbar_section.dart';
import 'package:loudnews/views/components/home_screen/headlines_section.dart';
import 'package:loudnews/views/components/home_screen/news_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBarSection(),
              HeadlinesSection(),
              NewsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
