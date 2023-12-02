import 'package:json_annotation/json_annotation.dart';
part 'get_customer_code.g.dart';

@JsonSerializable()
class GetCustomerCode {
  @JsonKey(name: 'pelanggan_code')
  String? code_pelanggan;
  @JsonKey(name: 'nama_usaha')
  String? nama_usaha;
  @JsonKey(name: 'nama_pj')
  String? nama_pj;
  @JsonKey(name: 'jabatan_pj')
  String? jabatan_pj;
  @JsonKey(name: 'phone_number')
  String? phone_number;
  @JsonKey(name: 'provinsi')
  ProvinceName? provinsi;
  @JsonKey(name: 'provinsi_id')
  String? provinsi_id;
  @JsonKey(name: 'kabupaten_kota')
  KabKotaName? kabupaten_kota;
  @JsonKey(name: 'kabupaten_kota_id')
  String? kabupaten_kota_id;
  @JsonKey(name: 'kecamatan')
  KecamatanName? kecamatan;
  @JsonKey(name: 'kecamatan_id')
  String? kecamatan_id;
  @JsonKey(name: 'alamat')
  String? alamat;
  @JsonKey(name: 'category')
  CategoryTitle? kategori;
  @JsonKey(name: 'category_bussines')
  CategoryBusinessTitle? kategoriBisnis;

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
  factory GetCustomerCode.fromJson(Map<String, dynamic> json) =>
      _$GetCustomerCodeFromJson(json);
  // GetCustomerCode.fromJson(Map<String, dynamic> json) {
  //   this.code_pelanggan = json["pelanggan_code"];
  //   this.nama_usaha = json["nama_usaha"];
  //   this.nama_pj = json["nama_pj"];
  //   this.jabatan_pj = json["jabatan_pj"];
  //   this.phone_number = json["phone_number"];
  //   this.provinsi = json["provinsi"]["provinsi_name"];
  //   this.provinsi_id = json["provinsi_id"];
  //   this.kabupaten_kota = json["kabupaten_kota"]["kabupaten_kota_name"];
  //   this.kabupaten_kota_id = json["kabupaten_kota_id"];
  //   this.kecamatan = json["kecamatan"]["kecamatan_name"];
  //   this.kecamatan_id = json["kecamatan_id"];
  //   this.alamat = json["alamat"];
  //   this.kategori = json["category"]["title"];
  //   this.kategoriBisnis = json["category_bussines"]["title"];
  // }

  static List<GetCustomerCode> fromJsonList(List list) {
    if (list.length == 0) return List<GetCustomerCode>.empty();
    return list.map((e) => GetCustomerCode.fromJson(e)).toList();
  }
}

@JsonSerializable()
class ProvinceName {
  @JsonKey(name: 'provinsi_name')
  String? province_name;

  ProvinceName(this.province_name);

  factory ProvinceName.fromJson(Map<String, dynamic> json) =>
      _$ProvinceNameFromJson(json);
}

@JsonSerializable()
class KabKotaName {
  @JsonKey(name: 'kabupaten_kota_name')
  String? kab_kota_name;

  KabKotaName(this.kab_kota_name);

  factory KabKotaName.fromJson(Map<String, dynamic> json) =>
      _$KabKotaNameFromJson(json);
}

@JsonSerializable()
class KecamatanName {
  @JsonKey(name: 'kecamatan_name')
  String? kecamatan_name;

  KecamatanName(this.kecamatan_name);

  factory KecamatanName.fromJson(Map<String, dynamic> json) =>
      _$KecamatanNameFromJson(json);
}

@JsonSerializable()
class CategoryTitle {
  @JsonKey(name: 'title')
  String? category_title;

  CategoryTitle(this.category_title);

  factory CategoryTitle.fromJson(Map<String, dynamic> json) =>
      _$CategoryTitleFromJson(json);
}

@JsonSerializable()
class CategoryBusinessTitle {
  @JsonKey(name: 'title')
  String? category_business_title;

  CategoryBusinessTitle(this.category_business_title);

  factory CategoryBusinessTitle.fromJson(Map<String, dynamic> json) =>
      _$CategoryBusinessTitleFromJson(json);
}
