import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final int backgroundColor;
  final int textColor;
  final double textSize;
  final Function callback;
  const Button(
      {Key? key,
      required this.text,
      this.backgroundColor = 0xFF263238,
      this.textColor = 0xFFFFFFFF,
      this.textSize = 24,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: TextButton(
            child: Text(text,
                style: GoogleFonts.rubik(
                  textStyle:
                      TextStyle(fontSize: textSize, color: Color(textColor)),
                )),
            onPressed: () {
              callback(text);
            },
            style: TextButton.styleFrom(
                primary: Colors.black87,
                backgroundColor: Color(backgroundColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ))),
      ),
    );
  }
}
