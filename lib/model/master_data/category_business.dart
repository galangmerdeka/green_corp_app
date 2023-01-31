class CategoryBusiness {
  String? id;
  String? title;

  CategoryBusiness({this.id, this.title});

  CategoryBusiness.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
  }

  static List<CategoryBusiness> fromJsonList(List list) {
    if (list.length == 0) return List<CategoryBusiness>.empty();
    return list.map((e) => CategoryBusiness.fromJson(e)).toList();
  }
}
