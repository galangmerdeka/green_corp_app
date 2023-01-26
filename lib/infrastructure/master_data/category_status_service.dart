import 'dart:convert';

// import 'package:flutter/foundation.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/model/master_data/category_status.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CategoryStatusService {
  Future<List<CategoryStatus>> getCategoryStatusData({String category_name = ""}) async {
    Uri url = Uri.parse("${BASE_URL}//getStatusCategory");
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
          "status_category_id": "",
          "status_category_code": "",
          "status_category_ket": "",
          "status_category_name": category_name,
          "orderBy": "",
          "sort": ""
        },
      );

      var dataCategoryStatus = json.decode(response.body);

      var listCategoryStatus = dataCategoryStatus as Map<String, dynamic>;
      print("Data Category Status : ${listCategoryStatus["data"]}");
      var modelCategory =
          CategoryStatus.fromJsonList(listCategoryStatus["data"]);
      return modelCategory;
    } catch (e) {
      var errMessage = e.toString();
      print("Error : " + errMessage);
      return List<CategoryStatus>.empty();
    }
  }
}
