import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {

  final int index;
  final int rating;

  RatingItem({this.index, this.rating});


  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating ? 'img/star.png' : 'img/stargrey.png',
      width: 20,
    );
  }
}