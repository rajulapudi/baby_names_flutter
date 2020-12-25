import 'package:baby_names_bestmom/models/query_cond.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import 'package:strings/strings.dart';

class ReligiosDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final qdata = context.watch<QueryCond>();
    return Container(
      child: Column(children: [
        DropdownButton(
            value: qdata.religion,
            icon: Icon(Icons.arrow_downward_rounded, color: kyellowAvatarBg,),
            iconSize: 20,
            hint: Text('Religion'),
            elevation: 16,
            style: TextStyle(color: Colors.black54),
            underline: Container(
              height: 1,
              color: kPrimaryColor,
            ),
            items: ['hindu', 'muslim', "christian", 'sikh']
                .map((e) => DropdownMenuItem(
                    value: e,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(capitalize(e)),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Image.asset('images/religion/$e.png',
                                color: kPrimaryColor, height: 15.0),
                          )
                        ])))
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
