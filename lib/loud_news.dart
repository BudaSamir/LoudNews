import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loudnews/viewmodels/cubits/news_cubit/news_cubit.dart';
import 'package:loudnews/views/screens/layout.dart';

class LoudNews extends StatelessWidget {
  const LoudNews._internal();

  static const LoudNews _loudNews = LoudNews._internal();

  factory LoudNews() => _loudNews;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..fetchHeadLinesNews(),
      child: MaterialApp(
        title: 'Loud News',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.blue,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const Layout(),
      ),
    );
  }
}
