import 'package:flutter/foundation.dart';
import 'name_model.dart';

class SearchList extends ChangeNotifier {
  List<Name> searchResults = [];

  void addToResults(List<Name> results) {
    searchResults.addAll(results);
  }

  List<Name> get getList {
    List<Name> result = searchResults.toSet().toList();
    return result;
  }
}
