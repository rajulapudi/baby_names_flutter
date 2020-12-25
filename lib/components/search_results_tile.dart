import 'dart:math';
import 'package:baby_names_bestmom/models/favorites_list.dart';
import 'package:baby_names_bestmom/models/name_model.dart';
import 'package:baby_names_bestmom/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'favorite_button.dart';

class SearchResultTile extends StatelessWidget {
  final Name name;
  SearchResultTile({@required this.name});

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
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                direction: Axis.horizontal,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name.name, style: ksubHeadingTextStyle),
                        Text(name.meaning, style: kmeaningTextStyle),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: klightYelloBg,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: IconButton(
                        tooltip: 'Show Details of Name',
                        iconSize: 20.0,
                        color: kblueColor,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                        name: name,
                                      )));
                        },
                        icon: Icon(Icons.open_in_new_outlined),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: FavoriteButton(
                      status: name.isFav,
                      onPressed: () {
                        // Scaffold.of(context).showSnackBar(SnackBar(
                        //   content: Text("Adding to Favorites"),
                        // ));
                        _favslist.toggleFav(name);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
