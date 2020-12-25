import 'package:baby_names_bestmom/models/query_cond.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class AlphabetButton extends StatelessWidget {
  const AlphabetButton({Key key, this.setAlpha}) : super(key: key);
  final Function setAlpha;
  @override
  Widget build(BuildContext context) {
    final qdata = context.watch<QueryCond>();
    List<String> alphabets = [
      'a',
      'b',
      'c',
      'd',
      'e',
      'f',
      'g',
      'h',
      'i',
      'j',
      'k',
      'l',
      'm',
      'n',
      'o',
      'p',
      'q',
      'r',
      's',
      't',
      'u',
      'v',
      'w',
      'x',
      'y',
      'z'
    ];
    return Column(children: [
      Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: alphabets
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          qdata.updateStartsWith(e);
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          margin: EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                e.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: qdata.startsWith == e
                                        ? Colors.white
                                        : kPrimaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: qdata.startsWith == e
                                  ? kPrimaryColor
                                  : Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ),
                      ),
                    )
                    .toList()),
          )),
      Text(
        'Starting Letter Preference',
        style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w300),
      ),
    ]);
  }
}
