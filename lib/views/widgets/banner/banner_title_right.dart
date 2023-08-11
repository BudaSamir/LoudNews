import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerTitleRight extends StatelessWidget {
  final void Function()? onTap;
  final String imageUrl;
  final String title;
  final int articleCount;

  const BannerTitleRight({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.title,
    required this.articleCount,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 1.0),
        padding: const EdgeInsets.only(right: 25.0),
        height: 142.0,
        width: double.infinity,
        color: Colors.indigo,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover))),
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                          Colors.indigo,
                          Colors.transparent,
                        ])),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '$articleCount Articles',
                      style: GoogleFonts.poppins(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
