import 'package:baby_names_bestmom/models/query_cond.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class RasiDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final qdata = context.watch<QueryCond>();
    return Container(
      child: Column(children: [
        DropdownButton(
            value: qdata.rasi != null ? qdata.rasi : 'Rasi',
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: kPrimaryColor),
            underline: Container(
              height: 2,
              color: kPrimaryColor,
            ),
            items: [
              'Rasi',
              'dhanu',
              'kanya',
              'karka',
              'kumbha',
              'makar',
              'meena',
              'mesha',
              'mithun',
              'simha',
              'tula',
              'vrishabha',
              'vruschika'
            ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (value) {
              if (value != 'Rasi') {
                qdata.updateRasi(value);
              } else {
                qdata.updateRasi(null);
              }
            })
      ]),
    );
  }
}
