import 'package:baby_names_bestmom/models/query_cond.dart';
import 'package:baby_names_bestmom/screens/search/search_results.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final qdata = context.watch<QueryCond>();
    return FloatingActionButton(
      child: Icon(Icons.search),
      backgroundColor: kPrimaryColor,
      onPressed: () {
        var q = qdata.getQueryCond;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SearchResultsPage(q: q)));
      },
    );
  }
}
