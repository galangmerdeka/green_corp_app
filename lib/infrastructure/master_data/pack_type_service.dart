import 'dart:convert';

// import 'package:flutter/foundation.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/model/master_data/pack_type.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PackTypeService {
  Future<List<PackType>> getPackType() async {
    Uri url = Uri.parse("${BASE_URL}//getPackType");
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
          "category_id": "",
          "category_name": "",
          "orderBy": "",
          "sort": ""
        },
      );

      var dataPackType = json.decode(response.body);

      var listPackType = dataPackType as Map<String, dynamic>;
      print("Data Pack Type : ${listPackType["data"]}");
      var modelPackType = PackType.fromJsonList(listPackType["data"]);
      return modelPackType;
    } catch (e) {
      var errMessage = e.toString();
      print("Error : " + errMessage);
      return List<PackType>.empty();
    }
  }
}
