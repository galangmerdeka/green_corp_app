// import 'dart:convert';

// import 'dart:io';

class Category {
  String? id;
  String? title;

  Category({this.id, this.title});

  Category.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
  }

  static List<Category> fromJsonList(List list) {
    if (list.length == 0) return List<Category>.empty();
    return list.map((e) => Category.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    return data;
  }
}
