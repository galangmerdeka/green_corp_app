class CreatedDataModel {
  String? user_id;
  String? category_business_id;
  int? lokasi_gudang;
  String? nama_usaha;
  String? nama_pj;
  String? jabatan_pj;
  int? no_telp;
  int? province_id;
  int? kab_kota_id;
  int? kecamatan_id;
  String? alamat_detail;
  int harga = 0;
  String? jenis_uco;
  String? kemasan_id;
  double quantity_kg = 0.0;
  int quantity_liter = 0;
  String? kategori_status_id;

  CreatedDataModel({
    this.user_id,
    this.category_business_id,
    this.lokasi_gudang,
    this.nama_usaha,
    this.nama_pj,
    this.jabatan_pj,
    this.no_telp,
    this.province_id,
    this.kab_kota_id,
    this.kecamatan_id,
    this.alamat_detail,
    this.harga = 0,
    this.jenis_uco,
    this.kemasan_id,
    this.quantity_kg = 0.0,
    this.quantity_liter = 0,
    this.kategori_status_id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["user_id"] = this.user_id;
    data["category_bussines_id"] = this.category_business_id;
    data["lokasi_gudang"] = this.lokasi_gudang;
    data["nama_usaha"] = this.nama_usaha;
    data["nama_pj"] = this.nama_pj;
    data["jabatan_pj"] = this.jabatan_pj;
    data["no_tlp"] = this.no_telp;
    data["provinsi_id"] = this.province_id;
    data["kabupaten_kota_id"] = this.kab_kota_id;
    data["kecamatan_id"] = this.kecamatan_id;
    data["alamat_detail"] = this.alamat_detail;
    data["harga_satuan"] = this.harga;
    data["jenis_uco"] = this.jenis_uco;
    data["jenis_kemasan"] = this.kemasan_id;
    data["quantity_kg"] = this.quantity_kg;
    data["quantity_liter"] = this.quantity_liter;
    data["status_kategori"] = this.kategori_status_id;
    return data;
  }
}
