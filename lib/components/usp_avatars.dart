import 'package:flutter/material.dart';

import '../constants.dart';

class Usps extends StatelessWidget {
  final String text;
  final String label;
  Usps({this.label, this.text});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
              radius: 25.0,
              backgroundColor: klightblueColor,
              child: Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Text(
            label,
            style: klabelText,
          )
        ],
      ),
    );
  }
}
