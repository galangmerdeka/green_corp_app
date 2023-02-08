// import 'dart:html';

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/model/transaction/history.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GetTransaction {
  Future<Either<String, List<History?>>> getHistoryByParam({
    String? date,
    String? status_pelanggan,
    String? nama_usaha,
    String? status_kategori_code,
  }) async {
    Uri url = Uri.parse("${BASE_URL}transaction/get");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var mapHeaders = new Map<String, String>();
    // var data;
    // List<History?> listDataHistory = [];
    var listDataHistory;
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
          "status_pelanggan": status_pelanggan,
          "nama_usaha": nama_usaha,
          "date": date,
          "status_kategori_code": status_kategori_code,
          "orderBy": "",
          "sort": "",
        },
      );
      // print("response : " + response.body);
      var dataHistory = json.decode(response.body);
      if (response.statusCode != 200) {
        return left(dataHistory["message"]);
      }

      // print("Data History : " + dataHistory["data"][0]["id"].toString());
      listDataHistory = History.fromJsonList(dataHistory["data"]);
      // List data = dataHistory["data"];
      // for (var item in data) {
      //   listDataHistory.add(History.fromJson(item));
      // }
      return right(listDataHistory);
    } catch (e) {
      print(e.toString());
      return left(ERROR_SYSTEM);
    }
  }
}
