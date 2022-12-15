import 'package:flutter/material.dart';
import 'package:green_corp_app/theme.dart';

Widget TextFieldWidget(
  BuildContext context, {
  bool colorFieldFill = true,
  IconData? iconField = null,
  // required String hintText,
  required bool obsText,
  required TextEditingController textController,
  required String label,
  // String? Function(String?)? validatorField,
}) {
  return TextFormField(
    obscureText: obsText,
    controller: textController,
    style: secondaryTextStyle,
    decoration: InputDecoration(
      labelText: label,
      filled: colorFieldFill,
      // hintText: hintText,
      hintStyle: TextStyle(color: fourthColorGrey),
      fillColor: fieldBackground,
      prefixIcon: Icon(
        iconField,
        color: thirdTextColor,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
    ),
  );
}
