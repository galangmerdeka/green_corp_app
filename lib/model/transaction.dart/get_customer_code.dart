class GetCustomerCode {
  String? code_pelanggan;
  String? nama_usaha;
  String? nama_pj;
  String? jabatan_pj;
  String? phone_number;
  String? alamat;

  GetCustomerCode({this.code_pelanggan, this.nama_usaha});

  GetCustomerCode.fromJson(Map<String, dynamic> json) {
    this.code_pelanggan = json["pelanggan_code"];
    this.nama_usaha = json["nama_usaha"];
    this.nama_pj = json["nama_pj"];
    this.jabatan_pj = json["jabatan_pj"];
    this.phone_number = json["phone_number"];
    this.alamat = json["alamat"];
  }

  static List<GetCustomerCode> fromJsonList(List list) {
    if (list.length == 0) return List<GetCustomerCode>.empty();
    return list.map((e) => GetCustomerCode.fromJson(e)).toList();
  }
}
