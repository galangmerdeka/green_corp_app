class GetCustomerCode {
  String? code_pelanggan;
  String? nama_usaha;
  String? nama_pj;
  String? jabatan_pj;
  String? phone_number;
  String? provinsi;
  String? kabupaten_kota;
  String? kecamatan;
  String? alamat;
  String? kategori;

  GetCustomerCode({
    this.code_pelanggan,
    this.nama_usaha,
    this.nama_pj,
    this.jabatan_pj,
    this.phone_number,
    this.provinsi,
    this.kabupaten_kota,
    this.kecamatan,
    this.alamat,
    this.kategori,
  });

  GetCustomerCode.fromJson(Map<String, dynamic> json) {
    this.code_pelanggan = json["pelanggan_code"];
    this.nama_usaha = json["nama_usaha"];
    this.nama_pj = json["nama_pj"];
    this.jabatan_pj = json["jabatan_pj"];
    this.phone_number = json["phone_number"];
    this.provinsi = json["provinsi"]["provinsi_name"];
    this.kabupaten_kota = json["kabupaten_kota"]["kabupaten_kota_name"];
    this.kecamatan = json["kecamatan"]["kecamatan_name"];
    this.alamat = json["alamat"];
    this.kategori = json["category"]["title"];
  }

  static List<GetCustomerCode> fromJsonList(List list) {
    if (list.length == 0) return List<GetCustomerCode>.empty();
    return list.map((e) => GetCustomerCode.fromJson(e)).toList();
  }
}
