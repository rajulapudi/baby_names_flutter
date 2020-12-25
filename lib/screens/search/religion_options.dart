import 'package:baby_names_bestmom/models/query_cond.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class ReligiosDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final qdata = context.watch<QueryCond>();
    return Container(
      child: Column(children: [
        DropdownButton(
            value: qdata.religion != null ? qdata.religion : 'Religion',
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: kPrimaryColor),
            underline: Container(
              height: 2,
              color: kPrimaryColor,
            ),
            items: ['Religion', 'hindu', 'muslim', "christian", 'sikh']
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (newValue) {
              if (newValue != 'Religion') {
                qdata.updateReligion(newValue);
              } else {
                qdata.updateReligion(null);
              }
            })
      ]),
    );
  }
}
