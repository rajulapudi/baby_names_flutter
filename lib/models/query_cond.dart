import 'package:flutter/foundation.dart';

class QueryCond extends ChangeNotifier {
  String religion;
  String origin;
  String numerology;
  String gender;
  String rasi;
  String startsWith;
  double charLength = 4.0;

  void updateReligion(String value) {
    religion = value;
    notifyListeners();
  }

  void updateRasi(String value) {
    rasi = value;
    notifyListeners();
  }

  void updateGender(String value) {
    gender = value;
    notifyListeners();
  }

  void updateOrigin(String value) {
    origin = value;
    notifyListeners();
  }

  void updateNumerology(String value) {
    numerology = value;
    notifyListeners();
  }

  void updateStartsWith(String value) {
    startsWith = value;
    notifyListeners();
  }

  void updateCharLength(double value) {
    charLength = value;
    notifyListeners();
  }

  Map<String, String> get getQueryCond {
// TODO : Convert rasi to startsWith format

    Map<String, String> q = {
      'gender': gender,
      'starts_with': startsWith,
      'religion': religion,
      'numerology': numerology,
      'charLength': charLength.toString(),
    };
    return q;
  }
}
