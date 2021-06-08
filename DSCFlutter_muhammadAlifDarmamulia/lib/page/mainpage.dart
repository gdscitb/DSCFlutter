import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/page/settings.dart';

import 'home.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavIndex = 0;

  List<BottomNavigationBarItem> _bottomBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.public), label: "News"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
  ];

  List<Widget> _widget = [
    HomePage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widget[bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavIndex,
        items: _bottomBarItems,
        onTap: (selected) {
          setState(() {
            bottomNavIndex = selected;
          });
        },
      ),
    );
  }
}
