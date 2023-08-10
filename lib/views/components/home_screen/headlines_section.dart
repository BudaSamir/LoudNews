import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loudnews/viewmodels/cubits/news_cubit/news_cubit.dart';
import 'package:loudnews/views/widgets/headline_item.dart';

class HeadlinesSection extends StatefulWidget {
  const HeadlinesSection({Key? key}) : super(key: key);

  @override
  State<HeadlinesSection> createState() => _HeadlinesSectionState();
}

class _HeadlinesSectionState extends State<HeadlinesSection> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is SuccessFetchNews) {
          final List<Widget> headlinesItems = state.newsList
              .map((item) => HeadlineItem(
                    image: item.urlToImage,
                    title: item.title,
                    author: item.author,
                    newsCategory: item.source.name,
                    time: item.publishedAt,
                  ))
              .toList();
          return Column(
            children: [
              CarouselSlider(
                carouselController: _controller,
                items: headlinesItems,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.2,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: state.newsList.asMap().entries.map((e) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(e.key),
                    child: Container(
                      width: _current == e.key ? 20.0 : 10.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        borderRadius: _current == e.key
                            ? BorderRadius.circular(8.0)
                            : null,
                        shape: _current == e.key
                            ? BoxShape.rectangle
                            : BoxShape.circle,
                        color: _current == e.key
                            ? Theme.of(context).primaryColor
                            : Colors.grey.withOpacity(0.3),
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
