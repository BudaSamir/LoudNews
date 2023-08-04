import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final IconData? icon;

  const AppBarIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 45,
        width: 45,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.grey.shade100, shape: BoxShape.circle),
          child: IconButton(onPressed: () {}, icon: Icon(icon)),
        ),
      ),
    );
  }
}
