import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/model/wilayah/province.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProvinceService {
  Future<List<Province>> getProvinceData() async {
    Uri url = Uri.parse("${BASE_URL}//wilayah/getProvinsi");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var mapHeaders = new Map<String, String>();
    var modelsProvince;
    mapHeaders = {
      // "Content-Type": "application/json",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive",
      "Authorization": "Bearer $token",
    };
    // print(mapHeaders);
    try {
      var response = await http.post(
        url,
        headers: mapHeaders,
        body: {
          "orderBy": "provinsi_name", //default provinsi_id
          "sort": "asc", //default asc
        },
      );

      // print(response.body);

      var dataProvince = json.decode(response.body);
      // print(dataProvince);
      // if (dataProvince["status"] == 200) {
      // return List<Province>.empty();
      var listProvince = dataProvince as Map<String, dynamic>;
      print("Data Province : ${listProvince["data"]}");
      modelsProvince = Province.fromJsonList(listProvince["data"]);
      // return right(modelsProvince);
      // print(modelsProvince);
      // }
      return modelsProvince;
    } catch (e) {
      var errMessage = e.toString();
      print("Error : " + errMessage);
      return List<Province>.empty();
    }
  }
}
