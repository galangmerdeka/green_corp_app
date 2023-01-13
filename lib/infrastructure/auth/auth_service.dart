import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/model/user/role.dart';
import 'package:green_corp_app/model/user/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthServiceRepository {
  Future<Either<String, User>> signInUserAuth({required dataLogin}) async {
    // Response response;

    Uri url = Uri.parse("$BASE_URL//login");
    // var userData;
    try {
      print(dataLogin);
      var response = await http.post(url, body: dataLogin);

      var data = json.decode(response.body);
      if (data["status"] == 401 ||
          data["status"] == 404 ||
          data["status"] == 500) {
        return left(data["message"]);
      } else {
        var userData = data as Map<String, dynamic>;
        // print("data login : " + userData["data"].toString());
        var user = User.fromJson(userData["data"]);
        // var role = Role.fromJson(userData["data"]["role"]);
        // User _dataUser = new User();
        // print("data user" + _dataUser.getName().toString());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        //
        prefs.setString("token", user.token!);
        prefs.setString("token_exp", user.token_exp.toString());
        prefs.setString("role", user.role!.slug!);
        prefs.setString("user_id", user.id!);
        prefs.setString("user_name", user.name!);
        prefs.setString("user_type", user.type_user!);
        print("Set Token exp : " + prefs.getString("token_exp")!);
        print("User ID : " + prefs.getString("user_id")!);
        return right(user);
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
