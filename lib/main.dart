import 'package:baby_names_bestmom/models/favorites_list.dart';
import 'package:baby_names_bestmom/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => FavList(),
      child: MaterialApp(
        title: 'Baby Names Bestmom',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: klightYelloBg, primaryColor: Colors.white),
        // home: HomeScreen(),
        home: LoadingScreen(),
      ),
    );
  }
}
