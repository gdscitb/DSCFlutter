import 'package:flutter/material.dart';

import 'contacts.dart';
import 'chats.dart';
import 'feeds.dart';
import 'settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social App UI',
      home: Dashboard(),
    );
  }
}

// Dashboard, jadi container buat isi-isi tab lain

class Dashboard extends StatefulWidget {
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> with SingleTickerProviderStateMixin{

  int _selectedIndex = 1;
  static const WidgetsName = ["Contacts", "Chats", "Feeds", "Settings"];
  static List<Widget> _widgetOptions = <Widget> [Contacts(), ChatList(), Feeds(), Settings()];

  // pencet item di bottomnavbar
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(WidgetsName[_selectedIndex]),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            tooltip: 'Settings',
            onPressed: (){}
          )
        ]
      ),

      body: Container(
        padding: EdgeInsets.all(12),
        child: _widgetOptions[_selectedIndex]
      ),

      // Bottom NavBar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,

        items: <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Contacts"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chats",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: "Feeds",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )

        ],

        onTap: _onItemTapped,

      ),

      floatingActionButton:
        _selectedIndex == 0? FloatingActionButton(
          onPressed: (){},
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.person_add), // new chat
        ):_selectedIndex == 2? FloatingActionButton(
          onPressed: (){},
          backgroundColor: Colors.white,
          child: Icon(Icons.add, color: Colors.deepPurple,) // add status
        ):null,
    );
  }
}

class TextBar extends StatelessWidget {
  final String label;
  final Widget icon;
  TextBar({this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value){},
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.grey,
        labelText: "$label",
        suffixIcon: IconButton(onPressed: (){}, icon: icon)
      ),
    );
  }
}
