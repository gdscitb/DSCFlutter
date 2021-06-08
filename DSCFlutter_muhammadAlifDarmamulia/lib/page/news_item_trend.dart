import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/model/news_model.dart';

class NewsItemTrend extends StatelessWidget {
  final Datum news;

  const NewsItemTrend({
    Key key,
    this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken),
              image: NetworkImage(news.thumbnail)
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        Positioned(
          bottom: 8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    maxLines: 2,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                      )
                    ),
                  ),
                ],
              ),
            ),
          )
        )
      ],
    );
  }
}
