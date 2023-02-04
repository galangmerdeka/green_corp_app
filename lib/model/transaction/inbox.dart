class InboxData {
  String? id;
  String? order_code;
  String? pelanggan_code;
  String? nama_usaha;
  String? status_pelanggan;
  String? nama_pj;
  String? jabatan_pj;
  String? phone_number;
  String? provinsi;
  String? provinsi_id;
  String? kabupaten_kota;
  String? kabupaten_kota_id;
  String? kecamatan;
  String? kecamatan_id;
  String? kelurahan;
  String? kelurahan_id;
  String? alamat;
  String? kategori;
  String? kategori_bisnis;
  String? status_category_code;
  String? status_category_desc;

  InboxData({
    this.id,
    this.order_code,
    this.pelanggan_code,
    this.status_pelanggan,
    this.nama_usaha,
    this.nama_pj,
    this.jabatan_pj,
    this.phone_number,
    this.provinsi,
    this.provinsi_id,
    this.kabupaten_kota,
    this.kabupaten_kota_id,
    this.kecamatan,
    this.kecamatan_id,
    this.alamat,
    this.kategori,
    this.kategori_bisnis,
    this.status_category_code,
    this.status_category_desc,
  });

  InboxData.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.nama_usaha = json["customer"]["nama_usaha"] ?? null;
    this.order_code = json["order_code"];
    this.pelanggan_code = json["customer"]["pelanggan_code"] ?? null;
    this.status_pelanggan = json["status_pelanggan"] ?? null;
    this.nama_pj = json["customer"]["nama_pj"] ?? null;
    this.jabatan_pj = json["customer"]["jabatan_pj"] ?? null;
    this.phone_number = json["customer"]["phone_number"] ?? null;
    this.provinsi = json["customer"]["provinsi"]["provinsi_name"] ?? null;
    this.provinsi_id = json["customer"]["provinsi_id"] ?? null;
    this.kabupaten_kota =
        json["customer"]["kabupaten_kota"]["kabupaten_kota_name"] ?? null;
    this.kabupaten_kota_id = json["customer"]["kabupaten_kota_id"] ?? null;
    this.kecamatan = json["customer"]["kecamatan"]["kecamatan_name"] ?? null;
    this.kecamatan_id = json["customer"]["kecamatan_id"] ?? null;
    this.kelurahan =
        json["customer"]["kelurahan_desa"]["kelurahan_desa_name"] ?? null;
    this.kelurahan_id = json["customer"]["kelurahan_desa_id"] ?? null;
    this.alamat = json["customer"]["alamat"] ?? null;
    this.kategori = json["category"]["title"] ?? null;
    this.kategori_bisnis = json["category_bussines"]["title"] ?? null;
    this.status_category_code =
        json["status_category"]["status_category_code"] ?? null;
    this.status_category_desc = json["status_category"]["keterangan"] ?? null;
  }

  static List<InboxData> fromJsonList(List list) {
    if (list.length == 0) return List<InboxData>.empty();
    return list.map((e) => InboxData.fromJson(e)).toList();
  }
}
