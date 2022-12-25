class Regencies {
  String? id;
  String? province_id;
  String? name;

  Regencies({this.id, this.province_id, this.name});

  Regencies.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    province_id = json["province_id"];
    name = json["name"];
  }

  static List<Regencies> fromJsonList(List list) {
    if (list.length == 0) return List<Regencies>.empty();
    return list.map((e) => Regencies.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["province_id"] = this.province_id;
    data["name"] = this.name;
    return data;
  }
}
