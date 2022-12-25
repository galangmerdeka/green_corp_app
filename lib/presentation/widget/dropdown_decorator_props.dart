import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

DropDownDecoratorProps dropDownDecoratorPropsWidget(String label) {
  return DropDownDecoratorProps(
    dropdownSearchDecoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
