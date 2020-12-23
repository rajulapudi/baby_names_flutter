import 'package:flutter/material.dart';

import '../constants.dart';

class CardYellow extends StatelessWidget {
  final IconData icon;
  final String value;
  final String keyvalue;
  CardYellow({@required this.icon, this.keyvalue, this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        decoration: BoxDecoration(
            color: klightYelloBg, borderRadius: BorderRadius.circular(8.0)),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: CircleAvatar(
              radius: 30.0,
              backgroundColor: kyellowAvatarBg,
              child: Icon(icon),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Text(value,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54)),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  keyvalue,
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
