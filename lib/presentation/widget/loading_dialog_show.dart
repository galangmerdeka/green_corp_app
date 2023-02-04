import 'package:flutter/material.dart';
import 'package:green_corp_app/theme.dart';

Future<dynamic> loadingDialogShow(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Container(
        child: AlertDialog(
          // content: Center(child: CircularProgressIndicator()),

          title: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 10,
              ),
              Text(
                "Loading...",
                style: secondaryTextStyle,
              ),
            ],
          ),
        ),
      );
    },
  );
}
