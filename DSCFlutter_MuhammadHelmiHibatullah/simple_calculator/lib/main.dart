import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(Calculator());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
  ));
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primaryColor: Colors.white),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {

  String equation = ""; //atas
  String result = "";   //bawah
  String expression = "";  //yang dihitung
  double equationFontSize = 48.0;
  Color equationFontColor = Colors.black;
  double resultFontSize = 24.0;

  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == "C"){
        equation = "";
        result = "";
        equationFontColor = Colors.black;
      }

      else if(buttonText == "⌫"){
        if(equation == ""){
          equation = "";
          equationFontColor = Colors.black;
        }
        else {
          equation = equation.substring(0, equation.length - 1);
          equationFontColor = Colors.black;
        }
      }

      else if(buttonText == "="){
        equationFontSize = 24.0;
        resultFontSize = 48.0;
        equationFontColor = Colors.black54;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result = "Error";
        }

      }

      else{
        equationFontSize = 48.0;
        resultFontSize = 24.0;
        if(equation == ""){
          equation = buttonText;
          equationFontColor = Colors.black;
        }else {
          equation = equation + buttonText;
          equationFontColor = Colors.black;
        }
      }
    });
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor, Color textColor){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
          style: TextButton.styleFrom(
            shape: const ContinuousRectangleBorder(),
            side: BorderSide(color: Colors.black12, width: 1)
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: textColor
            ),
          )
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[


          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 200, 10, 0),
            child: Text(equation, style: TextStyle(
                fontSize: equationFontSize,
                color: equationFontColor
              ),
            ),
          ),


          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(result, style: TextStyle(
                color: Colors.blue,
                fontSize: resultFontSize
              ),
            ),
          ),


          Expanded(
            child: Divider(),
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          buildButton("C", 1, Colors.white, Colors.red),
                          buildButton("⌫", 1, Colors.white, Colors.blue),
                          buildButton("%", 1, Colors.white, Colors.blue),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("7", 1, Colors.white, Colors.black54),
                          buildButton("8", 1, Colors.white, Colors.black54),
                          buildButton("9", 1, Colors.white, Colors.black54),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("4", 1, Colors.white, Colors.black54),
                          buildButton("5", 1, Colors.white, Colors.black54),
                          buildButton("6", 1, Colors.white, Colors.black54),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("1", 1, Colors.white, Colors.black54),
                          buildButton("2", 1, Colors.white, Colors.black54),
                          buildButton("3", 1, Colors.white, Colors.black54),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton(".", 1, Colors.white, Colors.black54),
                          buildButton("0", 1, Colors.white, Colors.black54),
                          buildButton("00", 1, Colors.white, Colors.black54),
                        ]
                    ),
                  ],
                ),
              ),


              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          buildButton("÷", 1, Colors.white, Colors.blue),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("×", 1, Colors.white, Colors.blue),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("-", 1, Colors.white, Colors.blue),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("+", 1, Colors.white, Colors.blue),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("=", 1, Colors.blue, Colors.white),
                        ]
                    ),
                  ],
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}
