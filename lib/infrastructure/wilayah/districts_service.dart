import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/model/wilayah/districts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DistrictsService {
  Future<List<Districts>> getDistrictsData(String regency_id) async {
    Uri url = Uri.parse("${BASE_URL}//wilayah/getKecamatan");
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
          "kabupaten_kota_id": regency_id,
          "orderBy": "", //default provinsi_id
          "sort": "asc", //default asc
        },
      );

      var dataDistricts = json.decode(response.body);

      var listDistricts = dataDistricts as Map<String, dynamic>;
      print("Data District : ${listDistricts["data"]}");
      var modelDistricts = Districts.fromJsonList(listDistricts["data"]);
      return modelDistricts;
    } catch (e) {
      var errMessage = e.toString();
      print("Error : " + errMessage);
      return List<Districts>.empty();
    }
  }
}
