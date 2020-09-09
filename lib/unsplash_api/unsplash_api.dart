import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:unsplash_photo_gallery/model/model.dart';

class UnsplashApi {
  static const String API_KEY =
      'ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';
  static const String HOST = "https://api.unsplash.com";

  static Future<List<Photo>> getListOfPhotos() async {
    var randValue = Random().nextInt(20);
    var url = '$HOST/photos?client_id=$API_KEY&per_page=20';
    var response = await http.get(url);
    List<Photo> responseDecoded = [];
    if (response.statusCode == 200) {
      var dataList = json.decode(response.body);
      dataList.forEach((el) => responseDecoded.add(Photo.fromJson(el)));
    } else {
      print("err");
    }
    return responseDecoded;
  }

  static Future<List<Photo>> getPhotoByKeyword(String keyword) async {
    var url = '$HOST/search/photos?client_id=$API_KEY&query=$keyword';

    var response = await http.get(url);

    List<Photo> responseDecoded = [];
    if (response.statusCode == 200) {
      var dataList = json.decode(response.body)['results'];
      if (dataList != null)
        dataList.forEach((el) => responseDecoded.add(Photo.fromJson(el)));
    } else {
      print("err");
    }
    return responseDecoded;
  }
}
