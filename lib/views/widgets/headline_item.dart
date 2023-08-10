import 'package:flutter/material.dart';

class HeadlineItem extends StatelessWidget {
  final String image;
  final String newsCategory;
  final String title;
  final String author;
  final String time;

  const HeadlineItem(
      {super.key,
      required this.image,
      required this.newsCategory,
      required this.title,
      required this.author,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Stack(
        children: [
          // News Image
          Image.network(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          // News Category
          Positioned(
            top: 10,
            left: 20,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(16.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    newsCategory,
                    style: const TextStyle(color: Colors.white),
                  ),
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // News Info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '$author • $time',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              // News Title
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 20),
                child: DecoratedBox(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )),
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
