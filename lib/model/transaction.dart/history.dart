class History {
  String? date, id_pelanggan, order_id, nama_usaha, pic, status;
  int? qty;

  History({
    this.date,
    this.id_pelanggan,
    this.order_id,
    this.nama_usaha,
    this.pic,
    this.status,
    this.qty,
  });
}

var listHistory = [
  History(
    date: "2022-09-09",
    id_pelanggan: "C-0001",
    order_id: "ORD-001",
    nama_usaha: "Hotel Ave Kalimantan",
    pic: "Agus",
    qty: 10,
    status: "Persetujuan",
  ),
  History(
    date: "2022-09-10",
    id_pelanggan: "C-0002",
    order_id: "ORD-002",
    nama_usaha: "Hotel Horison Kalimantan",
    pic: "Yudha",
    qty: 110,
    status: "Submit",
  ),
  History(
    date: "2022-09-11",
    id_pelanggan: "C-0003",
    order_id: "ORD-003",
    nama_usaha: "Warung Emak Sholeh",
    pic: "Sholeh",
    qty: 2000,
    status: "Persetujuan",
  ),
  History(
    date: "2022-09-11",
    id_pelanggan: "C-0004",
    order_id: "ORD-004",
    nama_usaha: "PT Karya Kalimantan",
    pic: "Suban",
    qty: 35000,
    status: "Pengiriman",
  ),
];
