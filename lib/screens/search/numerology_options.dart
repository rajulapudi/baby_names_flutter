import 'package:baby_names_bestmom/models/query_cond.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class NumerologyDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final qdata = context.watch<QueryCond>();
    return Container(
      child: Column(children: [
        DropdownButton(
            value: qdata.numerology != null ? qdata.numerology : 'Number',
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: kPrimaryColor),
            underline: Container(
              height: 2,
              color: kPrimaryColor,
            ),
            items: [
              'Number',
              '1',
              '2',
              '3',
              '4',
              '5',
              '6',
              '7',
              '8',
              '9',
              '11',
              '22'
            ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (value) {
              if (value != 'Number') {
                qdata.updateNumerology(value);
              } else {
                qdata.updateNumerology(null);
              }
            })
      ]),
    );
  }
}
