import 'package:json_annotation/json_annotation.dart';
part 'get_customer.g.dart';

@JsonSerializable()
class GetCustomer {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'nama_usaha')
  String? nama_usaha;
  @JsonKey(name: 'pelanggan_code')
  String? code_pelanggan;
  @JsonKey(name: 'nama_pj')
  String? nama_pj;
  @JsonKey(name: 'jabatan_pj')
  String? jabatan_pj;
  @JsonKey(name: 'phone_number')
  String? phone_number;
  @JsonKey(name: 'alamat')
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

  factory GetCustomer.fromJson(Map<String, dynamic> json) =>
      _$GetCustomerFromJson(json);

  // GetCustomer.fromJson(Map<String, dynamic> json) {
  //   this.id = json["id"];
  //   this.nama_usaha = json["nama_usaha"];
  //   this.code_pelanggan = json["pelanggan_code"];
  //   this.nama_pj = json["nama_pj"];
  //   this.jabatan_pj = json["jabatan_pj"];
  //   this.phone_number = json["phone_number"];
  //   this.alamat = json["alamat"];
  // }
}
