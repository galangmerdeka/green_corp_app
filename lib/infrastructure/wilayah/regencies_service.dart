import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/model/wilayah/regencies.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegenciesService {
  Future<List<Regencies>> getRegenciesData(String province_id) async {
    Uri url = Uri.parse("${BASE_URL}//wilayah/getKabupatenKota");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var mapHeaders = new Map<String, String>();
    mapHeaders = {
      // "Content-Type": "application/json",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive",
      "Authorization": "Bearer $token",
    };
    try {
      var response = await http.post(
        url,
        headers: mapHeaders,
        body: {
          "provinsi_id": province_id,
          "orderBy": "", //default provinsi_id
          "sort": "asc", //default asc
        },
      );

      var dataRegencies = json.decode(response.body);
      var listRegencies = dataRegencies as Map<String, dynamic>;
      print("Data Regencies : ${listRegencies["data"]}");
      var modelsRegencies = Regencies.fromJsonList(listRegencies["data"]);
      return modelsRegencies;
    } catch (e) {
      var errMessage = e.toString();
      print("Error : " + errMessage);
      return List<Regencies>.empty();
    }
  }
}
