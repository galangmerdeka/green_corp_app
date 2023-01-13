class Villages {
  int? villages_id;
  int? district_id;
  String? villages_name;

  Villages({this.villages_id, this.district_id, this.villages_name});

  Villages.fromJson(Map<String, dynamic> json) {
    villages_id = json["kelurahan_desa_id"];
    district_id = json["kecamatan_id"];
    villages_name = json["kelurahan_desa_name"];
  }

  static List<Villages> fromJsonList(List list) {
    if (list.length == 0) return List<Villages>.empty();
    return list.map((e) => Villages.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["kelurahan_desa_id"] = this.villages_id;
    data["kecamatan_id"] = this.district_id;
    data["kelurahan_desa_name"] = this.villages_name;
    return data;
  }
}
