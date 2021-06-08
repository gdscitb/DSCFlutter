import 'package:flutter/material.dart';
import 'package:news_app/data/preferences/preferences_helper.dart';
import 'package:news_app/data/preferences/preferences_provider.dart';
import 'package:news_app/page/home.dart';
import 'package:news_app/page/mainpage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
      ],
      child: Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'Flutter News App',
            theme: provider.themeData,
            home: MainPage(),
          );
        }
      ),
    );
  }
}
