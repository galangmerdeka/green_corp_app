import 'package:flutter/material.dart';

import '../../theme.dart';

Container itemDropdownBuilder(String item) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Text(
        "${item}",
        style: secondaryTextStyle,
      ),
    );
  }