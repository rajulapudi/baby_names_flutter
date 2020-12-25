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
            value: qdata.numerology,
            icon: Icon(
              Icons.arrow_downward_rounded,
              color: kyellowAvatarBg,
            ),
            iconSize: 20,
            hint: Text('Number'),
            elevation: 16,
            style: TextStyle(color: Colors.black54),
            underline: Container(
              height: 1,
              color: kPrimaryColor,
            ),
            items: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '11', '22']
                .map((e) => DropdownMenuItem(
                    value: e,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            backgroundColor: kyellowAvatarBg,
                            radius: 14.0,
                            child: CircleAvatar(
                              backgroundColor: klightYelloBg,
                              radius: 13.0,
                              child: Text(
                                e,
                                style: TextStyle(color: kblueColor),
                              ),
                            )),
                      ],
                    )))
                .toList(),
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
