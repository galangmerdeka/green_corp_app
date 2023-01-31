import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/model/wilayah/villages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class VillagesService {
  Future<List<Villages>> getVillagesData(String disctrict_id) async {
    Uri url = Uri.parse("${BASE_URL}wilayah/getKelurahanDesa");
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
      print("Kecamatan ID : " + disctrict_id);
      var response = await http.post(
        url,
        headers: mapHeaders,
        body: {
          "kecamatan_id": disctrict_id,
          "orderBy": "", //default provinsi_id
          "sort": "asc", //default asc
        },
      );
      print("Data Desa : " + response.body);
      var dataVillages = json.decode(response.body);
      var listVillages = dataVillages as Map<String, dynamic>;
      print("Data Villages : ${listVillages["data"]}");
      var modelVillages = Villages.fromJsonList(listVillages["data"]);
      return modelVillages;
    } catch (e) {
      var errMessage = e.toString();
      print("Error : " + errMessage);
      return List<Villages>.empty();
    }
  }
}
