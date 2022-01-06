import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_demo_01/models/model_movie.dart';

class NetWork {


  static Future<List<Results>> getDataInit({required String urlMovie}) async {

    var url = Uri.parse(urlMovie);
    var response = await http.get(url);
    if(response.statusCode == 200){
      var _tmp = jsonDecode(response.body);
      return Movies.fromJson(_tmp).results ?? [];
    }else{
      throw Exception("Err");
    }

  }
}