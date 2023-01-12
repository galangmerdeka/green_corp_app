class Packaging {
  String? id;
  String? title;

  Packaging({this.id, this.title});

  Packaging.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
  }

  static List<Packaging> fromJsonList(List list) {
    if (list.length == 0) return List<Packaging>.empty();
    return list.map((e) => Packaging.fromJson(e)).toList();
  }
}
