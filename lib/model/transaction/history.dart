class History {
  String? created_at,
      code_pelanggan,
      order_code,
      nama_usaha,
      status_pelanggan,
      status_category_code,
      keterangan;

  History(
      {this.created_at,
      this.code_pelanggan,
      this.order_code,
      this.nama_usaha,
      this.status_pelanggan,
      this.status_category_code,
      this.keterangan});

  History.fromJson(Map<String, dynamic> json) {
    this.code_pelanggan = json["customer"]["pelanggan_code"] ?? null;
    this.order_code = json["order_code"] ?? null;
    this.nama_usaha = json["customer"]["nama_usaha"] ?? null;
    this.status_pelanggan = json["status_pelanggan"] ?? null;
    this.status_category_code =
        json["status_category"]["status_category_code"] ?? null;
    this.keterangan = json["status_category"]["keterangan"] ?? null;
  }

  static List<History> fromJsonList(List list) {
    if (list.length == 0) return List<History>.empty();
    return list.map((e) => History.fromJson(e)).toList();
  }

  static where(Function(dynamic value) param0) {}
}

// var listHistory = [
//   History(
//     date: "2022-09-09",
//     id_pelanggan: "C-0001",
//     order_id: "ORD-001",
//     nama_usaha: "Hotel Ave Kalimantan",
//     pic: "Agus",
//     qty: 10,
//     status: "Persetujuan",
//   ),
//   History(
//     date: "2022-09-10",
//     id_pelanggan: "C-0002",
//     order_id: "ORD-002",
//     nama_usaha: "Hotel Horison Kalimantan",
//     pic: "Yudha",
//     qty: 110,
//     status: "Submit",
//   ),
//   History(
//     date: "2022-09-11",
//     id_pelanggan: "C-0003",
//     order_id: "ORD-003",
//     nama_usaha: "Warung Emak Sholeh",
//     pic: "Sholeh",
//     qty: 2000,
//     status: "Persetujuan",
//   ),
//   History(
//     date: "2022-09-11",
//     id_pelanggan: "C-0004",
//     order_id: "ORD-004",
//     nama_usaha: "PT Karya Kalimantan",
//     pic: "Suban",
//     qty: 35000,
//     status: "Pengiriman",
//   ),
// ];
