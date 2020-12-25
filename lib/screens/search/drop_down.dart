import 'package:baby_names_bestmom/screens/search/rasi_options.dart';
import 'package:baby_names_bestmom/screens/search/religion_options.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'numerology_options.dart';

class DropDowns extends StatelessWidget {
  const DropDowns({Key key, this.setReligion, this.setRasi, this.setNumerology})
      : super(key: key);
  final Function setReligion;
  final Function setRasi;
  final Function setNumerology;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ReligiosDropDown(),
              RasiDropDown(),
              NumerologyDropDown(),
            ],
          ),
          // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //   RasiDropDown(setRasi: setRasi),
          // ]),
        ],
      ),
    );
  }
}
