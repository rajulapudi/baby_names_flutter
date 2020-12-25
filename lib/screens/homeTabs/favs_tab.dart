import 'package:baby_names_bestmom/components/short_list_tile.dart';
import 'package:baby_names_bestmom/models/favorites_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class FavsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _favslist = context.watch<FavList>();
    print(_favslist.names);
    return Theme(
      data: new ThemeData.light(),
      child: Scaffold(
        backgroundColor: klightYelloBg,
        appBar: AppBar(
          backgroundColor: kblueColor,
          elevation: 0.0,
          title: SizedBox(
            child: Center(
              child: Text(
                'Shortlisted',
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              tooltip: 'Share List',
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Container(
            decoration: BoxDecoration(
                color: klightYelloBg,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListView.builder(
                    itemCount: _favslist.favNamesCount,
                    itemBuilder: (context, index) {
                      return ShortListedTile(
                        name: _favslist.names[index],
                      );
                    })),
          ),
        ),
      ),
    );
  }
}
