import 'package:cozy_kos/pages/splash.dart';
import 'package:cozy_kos/providers/spaceprovider.dart';
import 'package:cozy_kos/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        home: SplashPage(),
      ),
    );
  }
}