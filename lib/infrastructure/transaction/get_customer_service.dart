import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/model/transaction.dart/get_customer_code.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GetCustomerService {
  Future<List<GetCustomerCode>> getCustomerCodeAll() async {
    Uri url = Uri.parse("${BASE_URL}//customer/get");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var mapHeaders = new Map<String, String>();
    var listDataCustomerCode;
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
          "customer_code": "",
          "orderBy": "",
          "sort": "",
        },
      ).then(
        (value) {
          if (value.statusCode == 200) {
            var dataCustomerCode = json.decode(value.body);
            print("Data Customer : " + dataCustomerCode.toString());
            listDataCustomerCode =
                GetCustomerCode.fromJsonList(dataCustomerCode["data"]);
          }
        },
      );
      return listDataCustomerCode;
    } catch (e) {
      var errMessage = e.toString();
      print("Error : " + errMessage);
      return List<GetCustomerCode>.empty();
    }
  }

  Future<Either<String, List<GetCustomerCode>>> getCustomerCodeByCode(
      String customer_code) async {
    Uri url = Uri.parse("${BASE_URL}//customer/get");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var mapHeaders = new Map<String, String>();
    var data;
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
          "customer_code": customer_code,
          "orderBy": "",
          "sort": "",
        },
      ).then(
        (value) {
          if (value.statusCode == 200) {
            var dataCustomerCode = json.decode(value.body);
            // print("Data Customer : " + dataCustomerCode.toString());
            // listDataCustomerCode =
            //     GetCustomerCode.fromJsonList(dataCustomerCode["data"]);
            var customerByCode = dataCustomerCode as Map<String, dynamic>;
            data = GetCustomerCode.fromJsonList(customerByCode["data"]);
          }
        },
      );
      return right(data);
    } catch (e) {
      var errMessage = e.toString();
      print("Error : " + errMessage);
      return left(e.toString());
    }
  }
}
