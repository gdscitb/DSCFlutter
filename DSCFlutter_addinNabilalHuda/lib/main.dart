import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/Button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculator App',
        theme: ThemeData(),
        home: Scaffold(
            backgroundColor: Colors.grey.shade800,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    padding: EdgeInsets.only(right: 12),
                    alignment: Alignment(1.0, 1.0),
                    child: Text(_history,
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                        )))),
                Container(
                    padding: EdgeInsets.all(12),
                    alignment: Alignment(1.0, 1.0),
                    child: Text(_expression,
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                        )))),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      text: 'AC',
                      backgroundColor: 0xFFE57373,
                      textColor: 0xFF263238,
                      callback: allClear,
                    ),
                    Button(
                      text: 'C',
                      backgroundColor: 0xFFE57373,
                      textColor: 0xFF263238,
                      callback: clear,
                    ),
                    Button(
                      text: '%',
                      backgroundColor: 0xFFFFFFFF,
                      textColor: 0xFF263238,
                      callback: numClick,
                    ),
                    Button(
                      text: '/',
                      backgroundColor: 0xFFFFFFFF,
                      textColor: 0xFF263238,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      text: '7',
                      backgroundColor: 0xFF757575,
                      textColor: 0xFFFFFFFF,
                      textSize: 27,
                      callback: numClick,
                    ),
                    Button(
                      text: '8',
                      backgroundColor: 0xFF757575,
                      textColor: 0xFFFFFFFF,
                      textSize: 27,
                      callback: numClick,
                    ),
                    Button(
                      text: '9',
                      backgroundColor: 0xFF757575,
                      textColor: 0xFFFFFFFF,
                      textSize: 27,
                      callback: numClick,
                    ),
                    Button(
                      text: '*',
                      backgroundColor: 0xFFFFFFFF,
                      textColor: 0xFF263238,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      text: '4',
                      backgroundColor: 0xFF757575,
                      textColor: 0xFFFFFFFF,
                      textSize: 27,
                      callback: numClick,
                    ),
                    Button(
                      text: '5',
                      backgroundColor: 0xFF757575,
                      textColor: 0xFFFFFFFF,
                      textSize: 27,
                      callback: numClick,
                    ),
                    Button(
                      text: '6',
                      backgroundColor: 0xFF757575,
                      textColor: 0xFFFFFFFF,
                      textSize: 27,
                      callback: numClick,
                    ),
                    Button(
                      text: '-',
                      backgroundColor: 0xFFFFFFFF,
                      textColor: 0xFF263238,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      text: '1',
                      backgroundColor: 0xFF757575,
                      textColor: 0xFFFFFFFF,
                      textSize: 27,
                      callback: numClick,
                    ),
                    Button(
                      text: '2',
                      backgroundColor: 0xFF757575,
                      textColor: 0xFFFFFFFF,
                      textSize: 27,
                      callback: numClick,
                    ),
                    Button(
                      text: '3',
                      backgroundColor: 0xFF757575,
                      textColor: 0xFFFFFFFF,
                      textSize: 27,
                      callback: numClick,
                    ),
                    Button(
                      text: '+',
                      backgroundColor: 0xFFFFFFFF,
                      textColor: 0xFF263238,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      text: '.',
                      backgroundColor: 0xFF757575,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    Button(
                      text: '0',
                      backgroundColor: 0xFF757575,
                      textColor: 0xFFFFFFFF,
                      textSize: 27,
                      callback: numClick,
                    ),
                    Button(
                      text: '00',
                      backgroundColor: 0xFF757575,
                      textColor: 0xFFFFFFFF,
                      textSize: 27,
                      callback: numClick,
                    ),
                    Button(
                      text: '=',
                      backgroundColor: 0xFFE57373,
                      textColor: 0xFF263238,
                      textSize: 29,
                      callback: evaluate,
                    ),
                  ],
                ),
              ],
            )));
  }
}
