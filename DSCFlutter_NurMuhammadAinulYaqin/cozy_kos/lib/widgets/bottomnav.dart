import 'package:cozy_kos/models/space.dart';
import 'package:cozy_kos/theme.dart';
import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {

  final String imageUrl;
  final bool isActive;

  BottomNavItem({this.imageUrl, this.isActive});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl, 
          width: 26,
        ),
        Spacer(),
        isActive ? Container(
          width: 30,
          height: 2,
          decoration: BoxDecoration(
            color: purpleColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(1000)
            ),

          ),
        ) : Container(),
      ],
    );
  }
}