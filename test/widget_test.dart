import 'dart:convert';

// import 'package:green_corp_app/model/user/user.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // cekSession();
}

// Future<bool> cekSession() async {
//   String? token = null;
//   DateTime? token_exp = DateTime.tryParse("2023-01-07 19:38:22");
//   if (token == null) {
//     // prefs.setBool("is_session", false);
//     print("false (token kosong)");
//     return false;
//   } else if (token_exp != null) {
//     var dateNow = DateTime.now();
//     final differenceInMilliseconds =
//         dateNow.difference(token_exp).inMilliseconds;
//     if (differenceInMilliseconds > 0) {
//       // prefs.setBool("is_session", false);
//       print("false token sudah exp");
//       return false;
//     }
//   }
//   // prefs.setBool("is_session", true);
//   print("masih ada session");
//   return true;
// }
