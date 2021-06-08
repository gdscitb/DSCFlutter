import 'package:ipcalc/models/matkul.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ipcalc/screens/homepage.dart';
import 'package:ipcalc/screens/add_matkul.dart';
import 'package:ipcalc/screens/edit_matkul.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => MatkulModel(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<MatkulModel>(context).load();
    return MaterialApp(
      title: 'IP Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/matkul/add': (context) => AddMatkulPage(),
        '/matkul/edit': (context) => EditMatkulPage()
      },
    );
  }
}
