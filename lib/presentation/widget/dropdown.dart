import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

DropdownSearch DropDown({
  required List<String> itemList,
  required String labelField,
  required Function(String?) function,
}) {
  return DropdownSearch<String>(
    onChanged: function,
    popupProps: PopupProps.menu(
      showSelectedItems: true,
    ),
    items: itemList,
    dropdownDecoratorProps: DropDownDecoratorProps(
      dropdownSearchDecoration: InputDecoration(
        labelText: labelField,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
