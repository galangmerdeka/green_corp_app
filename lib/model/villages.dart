class Villages {
  String? id;
  String? district_id;
  String? name;

  Villages({this.id, this.district_id, this.name});

  Villages.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    district_id = json["district_id"];
    name = json["name"];
  }

  static List<Villages> fromJsonList(List list) {
    if (list.length == 0) return List<Villages>.empty();
    return list.map((e) => Villages.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["district_id"] = this.district_id;
    data["name"] = this.name;
    return data;
  }
}
