import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;
  Future getData() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      // print(jsonResponse['list']);
      // sending only the names list ** we also have query condition , page and has next objects
      return jsonResponse['list'];
    } else {
      print('failed response');
    }
  }

  Future getArticle() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      // print(jsonResponse);
      // sending only the names list ** we also have query condition , page and has next objects
      return jsonResponse;
    } else {
      print('failed response');
    }
  }

  Future postMethod(body) async {
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse['list']);
      // sending only the names list ** we also have query condition , page and has next objects
      return jsonResponse['list'];
    } else {
      print('failed response');
    }
  }
}
