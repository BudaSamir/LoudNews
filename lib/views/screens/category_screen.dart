import 'package:flutter/material.dart';
import 'package:loudnews/models/category_model.dart';
import 'package:loudnews/views/widgets/banner/banner_title_left.dart';
import 'package:loudnews/views/widgets/banner/banner_title_right.dart';

import '../../viewmodels/cubits/categories_cubit/categories_cubit.dart';
import 'news_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categoriesCubit = CategoriesCubit.get(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(bottom: 55),
          child: ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              if (index % 2 == 0) {
                return BannerTitleLeft(
                  onTap: () {
                    categoriesCubit.setCategory(categoriesList[index].title);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NewsScreen(),
                    ));
                  },
                  imageUrl: categoriesList[index].imageUrl,
                  title: categoriesList[index].title,
                );
              } else {
                return BannerTitleRight(
                  onTap: () {
                    categoriesCubit.setCategory(categoriesList[index].title);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NewsScreen(),
                    ));
                  },
                  imageUrl: categoriesList[index].imageUrl,
                  title: categoriesList[index].title,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
