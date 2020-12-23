import 'package:baby_names_bestmom/screens/homeTabs/home_screen.dart';
import 'package:baby_names_bestmom/screens/loading_screen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Names Bestmom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: klightYelloBg, primaryColor: Colors.white),
      // home: HomeScreen(),
      home: LoadingScreen(),
    );
  }
}
