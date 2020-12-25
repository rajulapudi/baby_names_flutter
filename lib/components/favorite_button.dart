import 'package:flutter/material.dart';

import '../constants.dart';

class FavoriteButton extends StatelessWidget {
  final Function onPressed;
  final bool status;
  FavoriteButton({this.onPressed, this.status});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: klightYelloBg, borderRadius: BorderRadius.circular(8.0)),
        child: FlatButton(
          onPressed: onPressed,
          child: status
              ? Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : Icon(
                  Icons.favorite_border_outlined,
                  color: kyellowAvatarBg,
                ),
        ));
    // return GestureDetector(
    //   onTap: () {
    //     print('pressed');
    //   },
    //   child: Container(
    //     decoration: BoxDecoration(
    //         color: klightYelloBg, borderRadius: BorderRadius.circular(8.0)),
    //     child: Padding(
    //       padding: const EdgeInsets.all(4.0),
    //       child: Icon(
    //         Icons.favorite_border_outlined,
    //         size: 26.0,
    //         color: kyellowAvatarBg,
    //       ),
    //     ),
    //   ),
    // );
  }
}
