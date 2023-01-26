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
  String? Function(String?)? validatorField,
  String? Function(String?)? savedData,
  Future<String?> Function()? tap,
  bool isReadOnly = false,
}) {
  return TextFormField(
    validator: validatorField,
    obscureText: obsText,
    readOnly: isReadOnly,
    controller: textController,
    style: secondaryTextStyle,
    onSaved: savedData,
    onTap: tap,
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
