class Regencies {
  int? kota_id;
  int? province_id;
  String? kota_name;

  Regencies({this.kota_id, this.province_id, this.kota_name});

  Regencies.fromJson(Map<String, dynamic> json) {
    kota_id = json["kabupaten_kota_id"];
    province_id = json["province_id"];
    kota_name = json["kabupaten_kota_name"];
  }

  static List<Regencies> fromJsonList(List list) {
    if (list.length == 0) return List<Regencies>.empty();
    return list.map((e) => Regencies.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["kabupaten_kota_id"] = this.kota_id;
    data["province_id"] = this.province_id;
    data["kabupaten_kota_name"] = this.kota_name;
    return data;
  }
}
