import 'package:flutter/material.dart';
import 'package:loudnews/views/screens/home_screen.dart';

class LoudNews extends StatelessWidget {
  const LoudNews({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loud News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
