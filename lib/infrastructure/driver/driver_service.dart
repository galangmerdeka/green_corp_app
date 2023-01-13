import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/model/driver/pickup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DriverService {
  Future<Either<String, List<PickupModel?>>> getDriverTaskByID(
      String driver_id) async {
    Uri url = Uri.parse("${BASE_URL}//driver/get");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var mapHeaders = new Map<String, String>();
    var modelDatatask;
    mapHeaders = {
      // "Content-Type": "application/json",
      "Accept-Encoding": "gzip, deflate, br",
      "Connection": "keep-alive",
      "Authorization": "Bearer $token",
    };

    print("driver id : " + driver_id);

    try {
      var response = await http.post(
        url,
        headers: mapHeaders,
        body: {
          "driver_id": driver_id,
          // "transaction_id": "",
          // "id_pelanggan": "",
          // "order_code": "",
          // "category_id": "",
          // "category_bussines_id": "",
          // "orderBy": "",
          // "sort": ""
        },
      );
      if (response.statusCode == 200) {
        var _dataTask = json.decode(response.body);
        // var _dataTaskList = _dataTask as List<dynamic>;
        print("Data Task : " + _dataTask["data"].toString());
        // print("Data : " + _dataTask["data"][0]["customer_id"]);
        modelDatatask = PickupModel.fromJsonList(_dataTask["data"]);
        // if (_dataTask["data"] == null) {
        //   return left("No Data Found");
        // }
        return right(modelDatatask);
      }
      return right(modelDatatask);
    } catch (e) {
      return left(e.toString());
    }
  }
}
