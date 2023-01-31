import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/model/transaction/inbox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GetInbox {
  Future<Either<String, List<InboxData?>>> getDataInboxByParam({
    String? nama_usaha,
    String? pelanggan_code,
  }) async {
    Uri url = Uri.parse("${BASE_URL}transaction/getInbox");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var mapHeaders = new Map<String, String>();
    var listDataInbox;
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
          "status_pelanggan": "",
          "nama_usaha": nama_usaha,
          "pelanggan_code": pelanggan_code,
          "orderBy": "",
          "sort": "",
        },
      );

      var dataInbox = json.decode(response.body);
      if (response.statusCode != 200) {
        return left(dataInbox["message"]);
      }

      listDataInbox = InboxData.fromJsonList(dataInbox["data"]);
      return right(listDataInbox);
    } catch (e) {
      return left(e.toString());
    }
  }
}
