// import 'dart:convert';

// import 'dart:io';

class Province {
  int? province_id;
  String? province_name;

  Province({this.province_id, this.province_name});

  Province.fromJson(Map<String, dynamic> json) {
    province_id = json["provinsi_id"];
    province_name = json["provinsi_name"];
  }

  static List<Province> fromJsonList(List list) {
    if (list.length == 0) return List<Province>.empty();
    return list.map((e) => Province.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["province_id"] = this.province_id;
    data["province_name"] = this.province_name;
    return data;
  }
}
