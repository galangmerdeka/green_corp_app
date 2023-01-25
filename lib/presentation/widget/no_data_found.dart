import 'package:flutter/material.dart';
import 'package:green_corp_app/theme.dart';
// import 'package:shared_preferences/shared_preferences.dart';

Container noDataFound(BuildContext context, Function()? function) {
  return Container(
    // color: Colors.red,
    padding: EdgeInsets.all(50),
    child: Center(
      child: Column(
        children: [
          Text(
            "No Data Found",
            style: secondaryTextStyle.copyWith(
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          IconButton(
            onPressed: function,
            icon: Icon(
              Icons.refresh_rounded,
              size: 30,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Refresh",
            style: secondaryTextStyle,
          ),
        ],
      ),
    ),
  );
}
