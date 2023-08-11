import 'package:flutter/material.dart';
import 'package:loudnews/models/category_model.dart';
import 'package:loudnews/views/widgets/banner/banner_title_left.dart';
import 'package:loudnews/views/widgets/banner/banner_title_right.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 55),
        child: ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            print(categoriesList.length);
            print(index);

            if (index % 2 == 0) {
              return BannerTitleLeft(
                onTap: () {},
                imageUrl: categoriesList[index].imageUrl,
                title: categoriesList[index].title,
                articleCount: 0,
              );
            } else {
              return BannerTitleRight(
                onTap: () {},
                imageUrl: categoriesList[index].imageUrl,
                title: categoriesList[index].title,
                articleCount: 0,
              );
            }
          },
        ),
      ),
    );
  }
}
