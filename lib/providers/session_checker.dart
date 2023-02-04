import 'package:shared_preferences/shared_preferences.dart';

class SessionChecker {
  void setSessionCondition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token") ?? "";
    String? token_time = prefs.getString("token_exp") ?? "";
    DateTime? token_exp = DateTime.tryParse(token_time);
    if (token.isEmpty) {
      print("Token Null");
      prefs.setBool("is_session", false);
    } else if (token_time.isNotEmpty) {
      print("Token Exp : " + token_time);
      var dateNow = DateTime.now();
      final differenceInMinutes = dateNow.difference(token_exp!).inMinutes;
      if (differenceInMinutes > 0) {
        prefs.remove("token");
        prefs.setBool("is_session", false);
      }
    }
    prefs.setBool("is_session", true);
  }
}
