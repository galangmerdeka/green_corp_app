// import 'package:green_corp_app/model/master_data/category.dart';
// import 'package:green_corp_app/model/master_data/category_status.dart';
import 'package:green_corp_app/model/master_data/gudang.dart';
import 'package:green_corp_app/model/master_data/packaging.dart';
import 'package:green_corp_app/model/transaction/get_customer.dart';
// import 'package:green_corp_app/model/user/user.dart';
import 'package:green_corp_app/model/user/user_created.dart';
import 'package:intl/intl.dart';

class PickupModel {
  String? id;
  String? order_code;
  String? lokasi_gudang;
  String? jenis_uco;
  String? quantity_liter;
  String? quantity_kg;
  String? harga_satuan;
  String? total_biaya;
  // int quantity_liter = 0;
  // double quantity_kg = 0.0;
  // int harga_satuan = 0;
  // int total_biaya = 0;
  GetCustomer? customer;
  String? total_kemasan;
  // int total_kemasan = 0;
  // Category? category;
  // CategoryStatus? category_status;
  UserCreated? user_created;
  Gudang? gudang;
  Packaging? packaging;
  String? pickup_start_time;
  String? pickup_date;

  PickupModel({
    this.id,
    this.order_code,
    this.lokasi_gudang,
    this.jenis_uco,
    this.quantity_liter,
    this.quantity_kg,
    this.harga_satuan,
    this.total_biaya,
    // this.quantity_liter = 0,
    // this.quantity_kg = 0.0,
    // this.harga_satuan = 0,
    // this.total_biaya = 0,
    this.customer,
    this.total_kemasan,
    // this.total_kemasan = 0,
    // this.category,
    // this.category_status,
    this.user_created,
    this.gudang,
    this.packaging,
    this.pickup_start_time,
    this.pickup_date,
  });

  PickupModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.order_code = json["order_code"];
    this.lokasi_gudang = json["lokasi_gudang"];
    this.jenis_uco = json["jenis_uco"];
    // this.quantity_liter = json["quantity_liter"] ?? 0;
    this.quantity_liter = json["quantity_liter"].toStringAsFixed(0);
    // this.quantity_kg =
    //     (json["quantity_kg"] == 0) ? 0.0 : json["quantity_kg"] ?? 0.0;
    this.quantity_kg = json["quantity_kg"].toStringAsFixed(2);
    // this.harga_satuan = json["harga_satuan"] ?? 0;
    // this.total_biaya = json["total_biaya"] ?? 0;
    // this.total_kemasan = json["total_kemasan"] ?? 0;
    this.harga_satuan = json["harga_satuan"].toString();
    this.total_biaya = json["total_biaya"].toString();
    this.total_kemasan = json["total_kemasan"].toString();
    this.customer = json["customer"] != null
        ? new GetCustomer.fromJson(json["customer"])
        : null;
    // this.category = json["category"] != null
    //     ? new Category.fromJson(json["category"])
    //     : null;
    // this.category_status = json["status_category"] != null
    //     ? new CategoryStatus.fromJson(json["status_category"])
    //     : null;
    this.user_created = json["user_created"] != null
        ? new UserCreated.fromJson(json["user_created"])
        : null;
    this.gudang =
        json["gudang"] != null ? Gudang.fromJson(json["gudang"]) : null;
    this.packaging = json["packaging"] != null
        ? Packaging.fromJson(json["packaging"])
        : null;
    this.pickup_start_time = json["pickup_start_time"];
    this.pickup_date =
        json["pickup_date"] ?? DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  static List<PickupModel> fromJsonList(List list) {
    if (list.length == 0) return List<PickupModel>.empty();
    return list.map((e) => PickupModel.fromJson(e)).toList();
  }
}
