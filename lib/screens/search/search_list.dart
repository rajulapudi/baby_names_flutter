import 'package:flutter/material.dart';

class SearchList extends StatefulWidget {
  String gender;
  String alpha;
  String rasi;
  String religion;
  String numerology;
  double charLength;

  SearchList(
      {Key key,
      this.gender,
      this.alpha,
      this.rasi,
      this.religion,
      this.numerology,
      this.charLength})
      : super(key: key);

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  void initState() {
// TODO get results and show pagination
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Search Results Page');
    // return FutureBuilder<BabyNamesModel>(
    //   future: _babyNamesModel,
    //   // initialData: InitialData,
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //     if (snapshot.hasData) {
    //       return snapshot.data.list.isEmpty
    //           ? Center(
    //               child: Text(
    //                   'We could not find any Names matching your criterion, please broaden your search'))
    //           : ;
    //     } else
    //       return Center(child: CircularProgressIndicator());
    //   },
    // );
  }
}
