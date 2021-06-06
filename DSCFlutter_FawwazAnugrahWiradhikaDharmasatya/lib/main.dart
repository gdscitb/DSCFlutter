import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(
  home:Calculator(),
));
class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final a = TextEditingController();
  final b = TextEditingController();
  final c = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
            'Root Calculator',
            style: TextStyle(
              fontSize: 28.0,
            ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[600],
      ),
      body:Padding(
        padding: EdgeInsets.all(16.0),
        child:Column(
          children: [
            Text(
                'Format persamaan: ax^2 + bx + c = 0',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
                'a:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: a,
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'b:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: b,
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'c:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: c,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          String x1 = getFirstRoot(double.parse(a.text), double.parse(b.text), double.parse(c.text));
          String x2 = getSecondRoot(double.parse(a.text), double.parse(b.text), double.parse(c.text));
          showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  content:Text('Akar dari persamaan: \n x1= $x1 \n x2= $x2'),
                );
              }
          );
        },
        child: Text(
            'HITUNG',
            style: TextStyle(
              fontSize: 12.0,
            ),
        ),

      ),
    );
  }
}
String getFirstRoot(double a,double b,double c){
    double D = b*b-4*a*c;
    if(D>=0){
      return ((-b + sqrt(D))/(2*a)).toStringAsPrecision(5);
    }
    else{
      if(b!=0)
        return((-b/(2*a)).toStringAsPrecision(5)+'+'+(sqrt(-D)/(2*a)).toStringAsPrecision(5)+'i');
      else
        return((sqrt(-D)/(2*a)).toStringAsPrecision(5)+'i');
    }

}
String getSecondRoot(double a,double b,double c){
  double D = b*b-4*a*c;
  if(D>=0){
    return ((-b - sqrt(D))/(2*a)).toStringAsPrecision(5);
  }
  else{
    if(b!=0)
      return((-b/(2*a)).toStringAsPrecision(5)+(sqrt(-D)/(2*a)).toStringAsPrecision(5)+'i');
    else
      return((sqrt(-D)/(2*a)).toStringAsPrecision(5)+'i');
  }

}