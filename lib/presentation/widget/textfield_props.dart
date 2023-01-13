import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:green_corp_app/theme.dart';

TextFieldProps textFieldProps() {
  return TextFieldProps(
    style: secondaryTextStyle,
    decoration: InputDecoration(
      hintText: "Type Search Here",
      hintStyle: secondaryTextStyle,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  );
}
