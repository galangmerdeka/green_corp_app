import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Color(0xffF1F0F2);
Color buttonColor = Color(0xff8DB403);
Color buttonColorGrey = Color(0xff8E8E8B);
Color buttonROHome = Color(0xffFAFAFA);

Color primaryTextColor = Color(0xff618E02);
Color secondaryTextColor = Color(0xffF1F0F2);
Color thirdTextColor = Color(0xff1F1D2B);
Color fieldBackground = Color(0xffF8F8F8);
Color fourthColorGrey = Color(0xff8E8E8B);

TextStyle primaryTextStyle = GoogleFonts.inter();
TextStyle secondaryTextStyle = GoogleFonts.inknutAntiqua();

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

double widthMainLogo = 380;
double heightMainLogo = 193;
double FieldPadding = 10;

// button style circular
ButtonStyle buttonStyleForForm = ButtonStyle(
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
  ),
);

ButtonStyle buttonStyleForNotForm = ButtonStyle(
  side: MaterialStateProperty.all(
    BorderSide(
      style: BorderStyle.solid,
      // width: 10,
    ),
  ),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);

// logo
BoxDecoration mainLogoDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage(
      'assets/images/logo_green_corp.png',
    ),
  ),
);

// bg_header at landing page
BoxDecoration bgHeaderDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage(
      'assets/images/bg_header.png',
    ),
  ),
);
