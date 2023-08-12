import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerTitleLeft extends StatelessWidget {
  final void Function()? onTap;
  final String imageUrl;
  final String title;

  const BannerTitleLeft({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 25.0),
        height: 142.0,
        width: double.infinity,
        color: Colors.indigo,
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                )),
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
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                          Colors.indigo,
                          Colors.transparent,
                        ])),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
