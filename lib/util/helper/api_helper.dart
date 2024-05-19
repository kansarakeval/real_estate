import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:real_estate/screen/home/model/home_model.dart';

class APIHelper {
  static APIHelper apiHelper = APIHelper._();

  APIHelper._();

  Future<List<HomeModel>?> homeApi() async {
    String apiLink = "http://192.168.31.177/real%20estate/api/viewapi.php";
    var response = await http.get(Uri.parse(apiLink));

    if (response.statusCode == 200) {
      List json = jsonDecode(response.body);
      List<HomeModel> homeList =
          json.map((e) => HomeModel.mapToModel(e)).toList();
      return homeList;
    } else {
      return null;
    }
  }
}
