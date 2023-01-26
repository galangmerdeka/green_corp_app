import 'package:flutter/material.dart';
import 'package:green_corp_app/config/constant.dart';
import 'package:green_corp_app/theme.dart';

Container infoNewFeature() {
    return Container(
      child: Center(
        child: Text(
          INFO_NEW_PAGE,
          style: secondaryTextStyle.copyWith(
            fontSize: 24,
          ),
        ),
      ),
    );
  }