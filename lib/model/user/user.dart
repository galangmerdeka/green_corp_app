// import 'package:flutter/material.dart';
import 'package:green_corp_app/model/user/role.dart';

class User {
  String? id;
  String? email;
  String? name;
  String? type_user;
  Role? role;
  String? token;
  DateTime? token_exp;

  User({
    this.id,
    this.email,
    this.name,
    this.type_user,
    this.role,
    this.token,
    this.token_exp,
  });

  User.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.email = json["email"];
    this.name = json["name"];
    this.type_user = json["type_user"];
    this.token = json["token"];
    this.token_exp = DateTime.parse(json["token_exp"]);
    this.role = json["role"] != null ? new Role.fromJson(json["role"]) : null;
    // notifyListeners();
  }

  static List<User> fromJsonList(List list) {
    if (list.length == 0) return List<User>.empty();
    return list.map((e) => User.fromJson(e)).toList();
  }

  // String? getToken() => token;

  String? getName() => name;

  String? getTypeUser() => type_user;
}
