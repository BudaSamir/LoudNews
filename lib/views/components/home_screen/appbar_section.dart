import 'package:flutter/material.dart';
import 'package:loudnews/views/widgets/appbar_icon.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarIcon(icon: Icons.menu),
        Row(
          children: [
            AppBarIcon(icon: Icons.search),
            AppBarIcon(icon: Icons.notifications),
          ],
        )
      ],
    );
  }
}
