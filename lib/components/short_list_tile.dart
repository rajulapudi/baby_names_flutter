import 'dart:math';
import 'package:baby_names_bestmom/models/favorites_list.dart';
import 'package:baby_names_bestmom/models/name_model.dart';
import 'package:baby_names_bestmom/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class ShortListedTile extends StatelessWidget {
  final Name name;
  ShortListedTile({@required this.name});

  int getRandomNumber() {
    Random rnd;
    int min = 1;
    int max = 23;
    rnd = new Random();
    int numb = min + rnd.nextInt(max - min);
    // need 1 - 6 numbers
    return numb;
  }

  @override
  Widget build(BuildContext context) {
    final _favslist = context.watch<FavList>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: klightYelloBg,
                    child: name.gender == 'boy'
                        ? Image.asset(
                            'images/avatars/boy-${getRandomNumber()}.png',
                            height: 32.0,
                          )
                        : Image.asset(
                            'images/avatars/girl-${getRandomNumber()}.png',
                            height: 32.0),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(name.name, style: ksubHeadingTextStyle),
                  )),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      name: name,
                                    )));
                      },
                      child: Icon(
                        Icons.note,
                        color: kblueColor,
                      )),
                  FlatButton(
                      onPressed: () {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Removing to Favorites"),
                        ));
                        _favslist.toggleFav(name);
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.black12,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
