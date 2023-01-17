import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:green_corp_app/theme.dart';

DropdownSearch DropDown({
  required List<String> itemList,
  required String labelField,
  required Function(String?) function,
  String? Function(String?)? validatorField,
}) {
  return DropdownSearch<String>(
    onChanged: function,
    validator: validatorField,
    popupProps: PopupProps.menu(
      showSelectedItems: true,
    ),
    items: itemList,
    dropdownDecoratorProps: DropDownDecoratorProps(
      dropdownSearchDecoration: InputDecoration(
        labelText: labelField,
        labelStyle: secondaryTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
