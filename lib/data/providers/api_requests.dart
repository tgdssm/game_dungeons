import 'package:dio/dio.dart';
import 'package:dungeons_and_dragons/ui/utils/globals.dart';

import '../models/player_class.dart';

const url = "https://www.dnd5eapi.co/api/";

class APIRequests {

  static Future<List<PlayerClass>> getClasses() async {
    List<PlayerClass> classes = [];

    final response = await Dio().get(url + 'classes');

    if(response.statusCode == 200) {
      try {
        response.data['results'].forEach((pClass) {
          classes.add(PlayerClass.fromJson(baseClasses.firstWhere((element) => element['class'] == pClass['index'])));
        });
      } catch(_)  {}
    }
    return classes;
  }


}