import 'package:flutter/foundation.dart';
import 'name_model.dart';

class FavList extends ChangeNotifier {
  List<Name> names = [];

  int get favNamesCount {
    return names.length;
  }



  void toggleFav(Name n) {
    if (!names.contains(n)) {
      names.add(n);
      n.makeFav();
    } else {
      names.remove(n);
      n.notFav();
    }
    notifyListeners();
  }

}
