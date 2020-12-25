import 'package:baby_names_bestmom/components/name_card_scroll.dart';
import 'package:baby_names_bestmom/models/name_model.dart';
import 'package:baby_names_bestmom/screens/search/search_main.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class HomeTab extends StatelessWidget {
  final List<Name> popularNames;
  HomeTab({this.popularNames});
  @override
  Widget build(BuildContext context) {
    print(popularNames);
    return Column(children: [
      Container(
          color: Colors.white,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Find ',
                      style: ksubHeadingTextStyle,
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen()));
                      },
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  'Your Baby Name',
                  textAlign: TextAlign.start,
                  style: kHeadingTextStyle,
                ),
                SizedBox(height: 20.0),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        gradient: LinearGradient(colors: [
                          kblueColor,
                          Color(0xFF609BF9),
                          Color(0xFF97BCF7)
                        ])),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20.0),
                                Text(
                                  'Get Started ..',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  'Specify your search criterion',
                                  style: TextStyle(color: Colors.white30),
                                ),
                                SizedBox(height: 20.0),
                              ],
                            ),
                          ),
                          Container(
                            child: Image(
                              image: AssetImage('./images/images/baby1.png'),
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                            ),
                          )
                        ]))
              ],
            ),
          )),
      Expanded(
        child: Container(
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                  color: klightYelloBg,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 30.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular Names',
                          style: ksubHeadingTextStyle,
                        ),
                        Text(
                          'show all',
                          style: TextStyle(color: kyellowAvatarBg),
                        )
                      ]),
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          NameCard(name: popularNames[index]),
                      itemCount: popularNames.length),
                  //     child: ListView(
                  //   scrollDirection: Axis.horizontal,
                  //   children: [
                  //     NameCard(
                  //         gend: 'boy',
                  //         religion: 'Christian',
                  //         meaning: 'Meaning of the name is ....'),
                  //     NameCard(
                  //         gend: 'girl',
                  //         religion: 'Christian',
                  //         meaning: 'Meaning of the name is ....'),
                  //   ],
                  // )
                ),
              ]),
            )),
      ),
      SizedBox(height: 10.0)
    ]);
  }
}
