import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app_api/services_models/models.dart';

class API_Manager {
  Future getQuran(context) async {
    var client = http.Client();
    var quranModel = null;

    var response =
        await DefaultAssetBundle.of(context).loadString('assets/quran.json');

    var jsonString = response;
    var jsonMap = json.decode(jsonString);
    quranModel = QuranModel.fromJson(jsonMap);

    return quranModel;
  }
}
