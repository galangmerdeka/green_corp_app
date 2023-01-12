class Gudang {
  int? kabupaten_kota_id;
  int? provinsi_id;
  String? kabupaten_kota_name;

  Gudang({
    this.kabupaten_kota_id,
    this.provinsi_id,
    this.kabupaten_kota_name,
  });

  Gudang.fromJson(Map<String, dynamic> json) {
    this.kabupaten_kota_id = json["kabupaten_kota_id"];
    this.provinsi_id = json["provinsi_id"];
    this.kabupaten_kota_name = json["kabupaten_kota_name"];
  }

  static List<Gudang> fromJsonList(List list) {
    if (list.length == 0) return List<Gudang>.empty();
    return list.map((e) => Gudang.fromJson(e)).toList();
  }
}
