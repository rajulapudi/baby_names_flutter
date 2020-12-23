import 'package:baby_names_bestmom/screens/home_screen.dart';
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
      home: HomeScreen(),
    );
  }
}
