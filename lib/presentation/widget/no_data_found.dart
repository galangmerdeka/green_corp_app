import 'package:flutter/material.dart';
import 'package:green_corp_app/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

Container noDataFound(BuildContext context, Function() function) {
  return Container(
    child: Center(
      child: Column(
        children: [
          Icon(
            Icons.hourglass_empty_rounded,
            size: 20,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "No Data Found",
            style: secondaryTextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          IconButton(
            onPressed: function,
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
    ),
  );
}
