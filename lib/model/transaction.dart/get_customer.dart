class GetCustomer {
  String? id;
  String? nama_usaha;
  String? code_pelanggan;
  String? nama_pj;
  String? jabatan_pj;
  String? phone_number;
  String? alamat;

  GetCustomer({
    this.id,
    this.nama_usaha,
    this.code_pelanggan,
    this.nama_pj,
    this.jabatan_pj,
    this.phone_number,
    this.alamat,
  });

  GetCustomer.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.nama_usaha = json["nama_usaha"];
    this.code_pelanggan = json["pelanggan_code"];
    this.nama_pj = json["nama_pj"];
    this.jabatan_pj = json["jabatan_pj"];
    this.phone_number = json["phone_number"];
    this.alamat = json["alamat"];
  }
}
