import 'package:flutter/material.dart';
import 'package:green_corp_app/presentation/user/login_screen.dart';
import 'package:green_corp_app/presentation/user/ro/modal_filter_history.dart';
import 'package:green_corp_app/presentation/widget/snackbar_custom.dart';
import 'package:green_corp_app/theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

PreferredSizeWidget AppBarCustom(BuildContext context, String titleScreen) {
  return AppBar(
    backgroundColor: primaryTextColor,
    title: Text(titleScreen),
    actions: [
      (titleScreen == "History")
          ? Container()
          : IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove("token");
                prefs.remove("token_exp");
                prefs.remove("role");
                prefs.setBool("is_session", false);

                print(
                    "Set Session : " + prefs.getBool("is_session").toString());
                var snackbar = SnackBarCustom(title: "Logout Succesfully");
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                Get.offAllNamed(LoginScreen.routeName);
              },
              icon: Icon(
                Icons.exit_to_app_rounded,
                size: 30,
                color: Colors.white54,
              ),
            ),
      (titleScreen == "History")
          ? IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return modalFilterHistory(context);
                  },
                );
              },
              icon: Icon(
                Icons.search_outlined,
                size: 30,
                color: Colors.white54,
              ),
            )
          : Container(),
    ],
  );
}
