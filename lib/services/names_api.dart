import 'dart:convert';
import 'package:baby_names_bestmom/models/articles_model.dart';
import 'package:baby_names_bestmom/models/name_model.dart';
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

  Future<List<Name>> getNamesPaginated(
      Map<String, String> q, int pageKey) async {
    var fetchNamesUrl =
        "https://babynames.bestmom.org/search/mobile/?page=$pageKey";
    NetworkHelper helper = NetworkHelper(fetchNamesUrl);
    String body = jsonEncode(q);
    var namesData = await helper.postMethod(body);
    return parseNames(namesData);
  }

// ARTICLES SECTION

  List<ArticleModel> parseArtciles(dynamic articles) {
    return articles
        .map<ArticleModel>((json) => ArticleModel.fromJson(json))
        .toList();
  }

// ignore: missing_return
  Future<List<ArticleModel>> getNamesArticles(page) async {
    try {
      var articleUrl =
          "https://bestmom.org/article/allposts?page=$page&cat=baby%20names";
      NetworkHelper helper = NetworkHelper(articleUrl);
      var articles = await helper.getArticle();
      print(articles);
      var result = parseArtciles(articles);
      print(articles);
      return result;
    } catch (e) {
      print(e);
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
}
