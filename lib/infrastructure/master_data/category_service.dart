import 'dart:convert';

// import 'package:flutter/foundation.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:green_corp_app/model/master_data/category.dart'
    as CategoryMaster;
import 'package:green_corp_app/model/master_data/category_business.dart';

class CategoryService {
  Future<List<CategoryMaster.Category>> getCategoryData() async {
    Uri url = Uri.parse("${BASE_URL}getCategory");
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

      var dataCategory = json.decode(response.body);

      var listCategory = dataCategory as Map<String, dynamic>;
      print("Data Category : ${listCategory["data"]}");
      var modelCategory =
          CategoryMaster.Category.fromJsonList(listCategory["data"]);
      return modelCategory;
    } catch (e) {
      var errMessage = e.toString();
      print("Error : " + errMessage);
      return List<CategoryMaster.Category>.empty();
    }
  }

  Future<List<CategoryBusiness>> getCategoryBusinessData({
    String category_id = "",
  }) async {
    Uri url = Uri.parse("${BASE_URL}getBussinesCategory");
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
        body: {"category_id": category_id, "orderBy": "", "sort": ""},
      );

      var dataCategoryBusiness = json.decode(response.body);

      var listCategoryBusiness = dataCategoryBusiness as Map<String, dynamic>;
      print("Data Category : ${listCategoryBusiness["data"]}");
      var modelCategoryBusiness =
          CategoryBusiness.fromJsonList(listCategoryBusiness["data"]);
      return modelCategoryBusiness;
    } catch (e) {
      var errMessage = e.toString();
      print("Error : " + errMessage);
      return List<CategoryBusiness>.empty();
    }
  }
}
