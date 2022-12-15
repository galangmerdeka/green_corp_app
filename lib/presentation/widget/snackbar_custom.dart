import 'package:flutter/material.dart';
import 'package:green_corp_app/theme.dart';

SnackBar SnackBarCustom({required String title}) {
  return SnackBar(
    content: Text(title),
    backgroundColor: primaryTextColor,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
    duration: Duration(seconds: 2),
  );
}
