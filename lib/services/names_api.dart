import 'dart:convert';

import 'package:baby_names_bestmom/models/name_model.dart';
import 'package:baby_names_bestmom/models/query_cond.dart';
import 'package:baby_names_bestmom/services/networking.dart';

class NamesApiModel {
  List<Name> parseNames(dynamic namesData) {
    return namesData.map<Name>((json) => Name.fromJson(json)).toList();
  }

  Future<List<Name>> getPopularNames() async {
    var fetchNamesUrl = "https://babynames.bestmom.org/search/mobile";
    NetworkHelper helper = NetworkHelper(fetchNamesUrl);
    var namesData = await helper.getData();
    return parseNames(namesData);
  }

  Future<List<Name>> getNamesPaginated(QueryCond q) async {
    var fetchNamesUrl = "https://babynames.bestmom.org/search/mobile";
    NetworkHelper helper = NetworkHelper(fetchNamesUrl);
    String body = jsonEncode(q);
    var namesData = await helper.postMethod(body);
    return parseNames(namesData);
  }
}

// Response res = await post("${EndPoints.fetch_names_url}/?page=${page}",
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'gender': gender,
//       'starts_with': alpha,
//       'religion':
//           religion.toString() == 'Religion' ? null : religion.toString(),
//       'numerology':
//           numerology.toString() == 'Number' ? null : numerology.toString(),
//       'charLength': charLength.toString(),
//       'rashi': rasi.toString() == 'Rasi' ? null : rasi.toString()
//     }));
