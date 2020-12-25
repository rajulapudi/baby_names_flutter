import 'package:baby_names_bestmom/models/name_model.dart';
import 'package:baby_names_bestmom/models/query_cond.dart';
import 'package:baby_names_bestmom/screens/search/search_list.dart';
import 'package:baby_names_bestmom/services/names_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResultsPage extends StatefulWidget {
  Map<String, String> q;
  SearchResultsPage({this.q});
  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  @override
  void initState() {
    getSearchResults(widget.q);
    super.initState();
  }

  void getSearchResults(Map<String, String> q) async {}

  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchList(),
    );
  }
}
