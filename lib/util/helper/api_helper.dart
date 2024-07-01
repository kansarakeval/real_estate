import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:real_estate/screen/home/model/home_model.dart';

class APIHelper {
  static APIHelper apiHelper = APIHelper._();

  APIHelper._();

  //read Api
  Future<List<HomeModel>?> homeApi() async {
    var apiLink = "http://192.168.1.34/real%20estate/api/viewapi.php";
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

  //insert Api
  Future<void> addApi(
      String name,
      String imagePath,
      String email,
      String mobile,
      String rating,
      String city,
      String description,
      String price,
      ) async {
    var apiLink = "http://192.168.1.34/real%20estate/api/addapi.php";

    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiLink));

      // var imageFile = File(imagePath);
      // if (!imageFile.existsSync()) {
      //   throw Exception("http://192.168.2.11/real%20estate/images/");
      // }

      // var imageLength = await imageFile.length();
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        imagePath,
        contentType: MediaType('image', 'jpeg'),
        filename: '${name}.jpg',
      ));

      request.fields['city'] = city;
      request.fields['description'] = description;
      request.fields['email'] = email;
      request.fields['mobile'] = mobile;
      request.fields['name'] = name;
      request.fields['price'] = price;
      request.fields['rating'] = rating;

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.transform(utf8.decoder).join();
        print(responseString);
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }

  //delete Api
  Future<void> deleteApi(String id) async {
    String deleteLink = "http://192.168.1.34/real%20estate/api/deleteapi.php";
    await http.post(Uri.parse(deleteLink), body: {
      "id": id,
    });
  }

}
