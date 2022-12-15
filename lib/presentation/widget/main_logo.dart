import 'package:flutter/material.dart';
import 'package:green_corp_app/theme.dart';

Widget MainLogo() {
  return Container(
    width: widthMainLogo,
    height: heightMainLogo,
    padding: EdgeInsets.only(
      top: 105,
      left: 30,
      right: 30,
    ),
    decoration: mainLogoDecoration,
  );
}
