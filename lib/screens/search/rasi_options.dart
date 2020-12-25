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
            disabledHint: Text('Rasi (Hindu)'),
            value: qdata.rasi,
            icon: Icon(
              Icons.arrow_downward_rounded,
              color: kyellowAvatarBg,
            ),
            iconSize: 20,
            hint: Text('Rasi'),
            elevation: 16,
            style: TextStyle(color: Colors.black54),
            underline: Container(
              height: 1,
              color: kPrimaryColor,
            ),
            items: [
              'dhanu',
              'kanya',
              'kark',
              'kumbh',
              'makar',
              'meen',
              'mesh',
              'mithun',
              'simha',
              'tula',
              'vrishabh',
              'vrishchak'
            ]
                .map((e) => DropdownMenuItem(
                    value: e,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(e),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Image.asset('images/rasi/$e.png',
                                color: kPrimaryColor, height: 20.0),
                          )
                        ])))
                .toList(),
            onChanged: qdata.religion == 'hindu'
                ? (value) => qdata.updateRasi(value)
                : null)
      ]),
    );
  }
}
