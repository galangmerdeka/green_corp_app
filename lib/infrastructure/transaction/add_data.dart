import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:green_corp_app/config/constant.dart';
// import 'package:green_corp_app/model/transaction.dart/created_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddData {
  Future<Either<String, String>> createdDataNew({
    required Map<String, dynamic> createdDataModel,
  }) async {
    Uri url = Uri.parse("${BASE_URL}transaction/add");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var mapHeaders = new Map<String, String>();
    mapHeaders = {
      "Content-Type": "application/json",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive",
      "Authorization": "Bearer $token",
    };
    try {
      var response = await http.post(
        url,
        headers: mapHeaders,
        body: json.encode(createdDataModel),
      );
      // print("response : " + response.body);
      var response_data = json.decode(response.body) as Map<String, dynamic>;
      print("response data : " + response_data.toString());
      // var response_list = response_data as Map<String, dynamic>;
      // print("response : " + response_list.toString());
      if (response_data["status"] != "200") {
        return left(response_data["message"]);
      }
      return right("Data Submitted");
    } catch (e) {
      print(e.toString());
      return left(ERROR_SYSTEM);
    }
  }

  Future<Either<String, String>> createdDataRepeat({
    required Map<String, dynamic> createdDataModel,
  }) async {
    Uri url = Uri.parse("${BASE_URL}transaction/repeat");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var mapHeaders = new Map<String, String>();
    mapHeaders = {
      "Content-Type": "application/json",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive",
      "Authorization": "Bearer $token",
    };
    try {
      var response = await http.post(
        url,
        headers: mapHeaders,
        body: json.encode(createdDataModel),
      );
      // print("response : " + response.body);
      var response_data = json.decode(response.body) as Map<String, dynamic>;
      print("response data : " + response_data.toString());
      // var response_list = response_data as Map<String, dynamic>;
      // print("response : " + response_list.toString());
      if (response_data["status"] != "200") {
        return left(response_data["message"]);
      }
      return right("Data Submitted");
    } catch (e) {
      print(e.toString());
      return left(ERROR_SYSTEM);
    }
  }
}
