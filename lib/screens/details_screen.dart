import 'package:baby_names_bestmom/components/card_yellow.dart';
import 'package:baby_names_bestmom/components/usp_avatars.dart';
import 'package:baby_names_bestmom/constants.dart';
import 'package:baby_names_bestmom/models/favorites_list.dart';
import 'package:baby_names_bestmom/models/name_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Name name;
  const DetailScreen({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _favslist = context.watch<FavList>();
    return Theme(
      data: new ThemeData.dark(),
      child: Scaffold(
        backgroundColor: kblueColor,
        appBar: AppBar(
          backgroundColor: kblueColor,
          elevation: 0.0,
          title: SizedBox(
            child: Center(
              child: Text(
                'Details of "${name.name}"',
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              tooltip: 'Share Name',
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          child: Column(children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                          child: CircleAvatar(
                              radius: 30.0,
                              backgroundColor: klightblueColor,
                              child: Image.asset(
                                'images/avatars/boy-1.png',
                                height: 52.0,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            name.name,
                            style: kHeadingTextStyle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: CardYellow(
                                icon: Icons.ad_units,
                                value: name.origin,
                                keyvalue: 'origin',
                              ),
                            ),
                            Expanded(
                              child: CardYellow(
                                icon: Icons.map,
                                value: name.religion,
                                keyvalue: 'religion',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Meaning',
                                      style: kHeadingTextStyle,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      name.meaning,
                                      style: kmeaningTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(children: [
                              Usps(
                                text: name.numerology.toString(),
                                label: 'Numerology',
                              ),
                              Usps(
                                text: '??',
                                label: 'Popularity',
                              ),
                              Usps(
                                text: '??',
                                label: 'Uniqueness',
                              ),
                            ]),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: klightYelloBg,
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: FlatButton(
                                        onPressed: () {
                                          _favslist.toggleFav(name);
                                        },
                                        child: name.isFav
                                            ? Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              )
                                            : Icon(
                                                Icons.favorite_border_outlined,
                                                color: kyellowAvatarBg,
                                              ))),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: klightYelloBg,
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Explore More Names',
                                          style: kactionText,
                                        ),
                                      )),
                                ),
                              )
                            ]),
                          ),
                        ),
                      ]))
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
