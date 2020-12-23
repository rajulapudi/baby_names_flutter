import 'package:baby_names_bestmom/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,

      ),
      body: Column(children: [
        Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Find ',
                    style: ksubHeadingTextStyle,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Your Baby Name',
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
                                image: AssetImage('assets/images/baby1.png'),
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
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Girls name',
                              style: ksubHeadingTextStyle,
                            ),
                            Text(
                              'show all',
                              style: TextStyle(color: kyellowAvatarBg),
                            )
                          ]),
                    ),
                    Expanded(
                        child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        NameCard(),
                        NameCard(),
                      ],
                    )),
                  ]),
                  decoration: BoxDecoration(
                      color: klightYelloBg,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      )))),
        )
      ]),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                size: 30.0,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                size: 30.0,
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article, size: 30.0),
              label: 'Reads',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kblueColor,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}

class NameCard extends StatelessWidget {
  String gend;
  NameCard({this.gend});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        height: 100.0,
        width: 300.0,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(child: Image.asset('assets/images/boy.png'),),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Mersede', style: ksubHeadingTextStyle),
                  )),
                  Icon(
                    Icons.close,
                    color: Colors.black12,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
