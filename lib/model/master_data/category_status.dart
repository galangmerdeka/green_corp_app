class CategoryStatus {
  String? id;
  String? title;
  String? status_kategori_code;
  String? keterangan;

  CategoryStatus(
      {this.id, this.title, this.status_kategori_code, this.keterangan});

  CategoryStatus.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    status_kategori_code = json["status_category_code"];
    keterangan = json["keterangan"];
  }

  static List<CategoryStatus> fromJsonList(List list) {
    if (list.length == 0) return List<CategoryStatus>.empty();
    return list.map((e) => CategoryStatus.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    data["status_category_code"] = this.status_kategori_code;
    data["keterangan"] = this.keterangan;
    return data;
  }
}
