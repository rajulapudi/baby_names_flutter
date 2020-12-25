import 'dart:math';
import 'package:baby_names_bestmom/models/favorites_list.dart';
import 'package:baby_names_bestmom/models/name_model.dart';
import 'package:baby_names_bestmom/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'favorite_button.dart';

class NameCard extends StatelessWidget {
  final Name name;
  NameCard({@required this.name});

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
        height: 100.0,
        width: 300.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
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
                  FavoriteButton(
                      status: name.isFav,
                      onPressed: () {
                        _favslist.toggleFav(name);
                      }),
                  // SizedBox(width: 15.0),
                  // Icon(
                  //   Icons.close,
                  //   color: Colors.black12,
                  // )
                ],
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${name.religion} name',
                          style: kreligionText,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Image(
                            image: AssetImage(
                                'images/religion/${name.religion}.png'),
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Text(
                          'Meaning : ',
                          style: kmeaningHeaderStyle,
                        ),
                        Text(
                          name.meaning,
                          style: kmeaningTextStyle,
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Container(
                        decoration: BoxDecoration(
                            color: klightYelloBg,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          name: name,
                                        )));
                          },
                          child: Text('Details',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
