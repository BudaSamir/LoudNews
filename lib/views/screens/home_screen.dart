import 'package:flutter/material.dart';
import 'package:loudnews/views/components/home_screen/appbar_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarSection(),
            ],
          ),
        ),
      ),
    );
  }
}
