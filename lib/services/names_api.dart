import 'package:baby_names_bestmom/models/name_model.dart';
import 'package:baby_names_bestmom/services/networking.dart';

class NamesApiModel {
  List<Name> parseNames(dynamic namesData) {
    return namesData.map<Name>((json) => Name.fromJson(json)).toList();
  }

  Future<List<Name>> getPopularNames() async {
    var fetch_names_url = "https://babynames.bestmom.org/search/mobile";
    NetworkHelper helper = NetworkHelper(fetch_names_url);
    var namesData = await helper.getData();
    return parseNames(namesData);
  }
}
