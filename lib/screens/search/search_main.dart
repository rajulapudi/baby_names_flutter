import 'package:baby_names_bestmom/models/query_cond.dart';
import 'package:baby_names_bestmom/screens/search/search_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import 'drop_down.dart';
import 'alpha_button.dart';
import 'gender_selection.dart';
import 'name_lenght_slider.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (BuildContext context) => QueryCond(),
      child: Theme(
        data: new ThemeData.light(),
        child: Scaffold(
          backgroundColor: klightYelloBg,
          appBar: AppBar(
            backgroundColor: kblueColor,
            elevation: 0.0,
            title: SizedBox(
              child: Center(
                child: Text(
                  'SEARCH FILTERS',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                tooltip: 'refresh search',
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GenderSelection(),
                AlphabetButton(),
                DropDowns(),
                NameLengthSlider(),
              ],
            ),
          ),
          floatingActionButton: SearchButton(),
        ),
      ),
    );
  }
}
