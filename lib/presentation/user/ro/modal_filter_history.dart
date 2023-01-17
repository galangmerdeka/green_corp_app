import 'package:flutter/material.dart';
import 'package:green_corp_app/theme.dart';

Container modalFilterHistory(BuildContext context) {
  return Container(
    height: 200,
    color: primaryColor,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Modal BottomSheet'),
          ElevatedButton(
            child: const Text('Close BottomSheet'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    ),
  );
}