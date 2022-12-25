class Districts {
  String? id;
  String? regency_id;
  String? name;

  Districts({this.id, this.regency_id, this.name});

  Districts.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    regency_id = json["regency_id"];
    name = json["name"];
  }

  static List<Districts> fromJsonList(List list) {
    if (list.length == 0) return List<Districts>.empty();
    return list.map((e) => Districts.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["regency_id"] = this.regency_id;
    data["name"] = this.name;
    return data;
  }
}
