import 'package:flutter/material.dart';
import 'package:green_corp_app/theme.dart';

Widget TextFieldWithoutIcon(
  BuildContext context, {
  bool colorFieldFill = true,
  // required String hintText,
  required bool obsText,
  TextEditingController? textController,
  required String label,
  TextInputType? inputType,
  TextAlignVertical? textAlignVer,
  int? contentMaxLines,
  String? contentPrefixText,
  bool readOnlyText = false,
  String? Function(String?)? convertValueOnChanged,
  String? initValue,
  // String? Function(String?)? validatorField,
}) {
  return TextFormField(
    initialValue: initValue,
    // onTap: ,
    onChanged: convertValueOnChanged,
    keyboardType: inputType,
    textAlignVertical: textAlignVer,
    maxLines: contentMaxLines,
    obscureText: obsText,
    controller: textController,
    readOnly: readOnlyText,
    style: secondaryTextStyle.copyWith(fontSize: 14, color: thirdTextColor),
    decoration: InputDecoration(
      suffixText: contentPrefixText,
      // hintMaxLines: ,
      labelText: label,
      filled: colorFieldFill,
      // hintText: hintText,
      hintStyle: TextStyle(color: fourthColorGrey),
      fillColor: fieldBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
    ),
  );
}
