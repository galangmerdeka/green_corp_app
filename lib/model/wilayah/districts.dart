class Districts {
  int? district_id;
  int? regency_id;
  String? district_name;

  Districts({this.district_id, this.regency_id, this.district_name});

  Districts.fromJson(Map<String, dynamic> json) {
    district_id = json["kecamatan_id"];
    regency_id = json["kabupaten_kota_id"];
    district_name = json["kecamatan_name"];
  }

  static List<Districts> fromJsonList(List list) {
    if (list.length == 0) return List<Districts>.empty();
    return list.map((e) => Districts.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["kecamatan_id"] = this.district_id;
    data["kabupaten_kota_id"] = this.regency_id;
    data["kecamatan_name"] = this.district_name;
    return data;
  }
}
