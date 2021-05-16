import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/model/news_model.dart';

class NewsItemTechno extends StatelessWidget {

  final Datum news;

  const NewsItemTechno({
    Key key,
    this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade500, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 135,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(news.thumbnail),
                fit: BoxFit.cover
              ),
            ),
          ),
          SizedBox(height: 12,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    news.summary,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    news.published,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey
                      ),
                    )
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
