import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:green_corp_app/theme.dart';

DropDownDecoratorProps dropDownDecoratorPropsWidget(String label) {
  return DropDownDecoratorProps(
    dropdownSearchDecoration: InputDecoration(
      labelText: label,
      labelStyle: secondaryTextStyle,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
