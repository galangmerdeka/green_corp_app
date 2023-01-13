class PackType {
  String? id;
  String? title;

  PackType({this.id, this.title});

  PackType.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
  }

  static List<PackType> fromJsonList(List list) {
    if (list.length == 0) return List<PackType>.empty();
    return list.map((e) => PackType.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    return data;
  }
}
