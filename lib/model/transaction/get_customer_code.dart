class GetCustomerCode {
  String? code_pelanggan;
  String? nama_usaha;
  String? nama_pj;
  String? jabatan_pj;
  String? phone_number;
  String? provinsi;
  String? provinsi_id;
  String? kabupaten_kota;
  String? kabupaten_kota_id;
  String? kecamatan;
  String? kecamatan_id;
  String? alamat;
  String? kategori;
  String? kategoriBisnis;

  GetCustomerCode({
    this.code_pelanggan,
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
    this.kategoriBisnis,
  });

  GetCustomerCode.fromJson(Map<String, dynamic> json) {
    this.code_pelanggan = json["pelanggan_code"];
    this.nama_usaha = json["nama_usaha"];
    this.nama_pj = json["nama_pj"];
    this.jabatan_pj = json["jabatan_pj"];
    this.phone_number = json["phone_number"];
    this.provinsi = json["provinsi"]["provinsi_name"];
    this.provinsi_id = json["provinsi_id"];
    this.kabupaten_kota = json["kabupaten_kota"]["kabupaten_kota_name"];
    this.kabupaten_kota_id = json["kabupaten_kota_id"];
    this.kecamatan = json["kecamatan"]["kecamatan_name"];
    this.kecamatan_id = json["kecamatan_id"];
    this.alamat = json["alamat"];
    this.kategori = json["category"]["title"];
    this.kategoriBisnis = json["category_bussines"]["title"];
  }

  static List<GetCustomerCode> fromJsonList(List list) {
    if (list.length == 0) return List<GetCustomerCode>.empty();
    return list.map((e) => GetCustomerCode.fromJson(e)).toList();
  }
}
