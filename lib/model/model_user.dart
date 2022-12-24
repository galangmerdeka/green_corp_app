import 'package:green_corp_app/domain/user/user.dart';

class ModelUser {
  static const DUMMY_USER = const [
    User(nik: "12344", password: "12345678", role: "sales_ro"),
    User(nik: "12345", password: "12345678", role: "driver"),
  ];
}
