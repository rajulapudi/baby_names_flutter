import 'package:baby_names_bestmom/models/name_model.dart';
import 'package:baby_names_bestmom/services/names_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'homeTabs/home_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getPopularNames();
  }

  void getPopularNames() async {
    List<Name> popularNames = await NamesApiModel().getPopularNames();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(popularNames: popularNames)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
