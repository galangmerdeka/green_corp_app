import 'package:flutter/material.dart';
import 'package:green_corp_app/presentation/user/login_screen.dart';
import 'package:green_corp_app/presentation/widget/snackbar_custom.dart';
import 'package:green_corp_app/theme.dart';
import 'package:get/get.dart';

PreferredSizeWidget AppBarCustom(BuildContext context, String titleScreen) {
  return AppBar(
    backgroundColor: primaryTextColor,
    title: Text(titleScreen),
    actions: [
      IconButton(
        onPressed: () {
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
    ],
  );
}
