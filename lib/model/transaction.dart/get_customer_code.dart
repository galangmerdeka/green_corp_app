class GetCustomerCode {
  String? code_pelanggan;
  String? nama_usaha;

  GetCustomerCode({this.code_pelanggan, this.nama_usaha});

  GetCustomerCode.fromJson(Map<String, dynamic> json) {
    this.code_pelanggan = json["pelanggan_code"];
    this.nama_usaha = json["nama_usaha"];
  }

  static List<GetCustomerCode> fromJsonList(List list) {
    if (list.length == 0) return List<GetCustomerCode>.empty();
    return list.map((e) => GetCustomerCode.fromJson(e)).toList();
  }
}
