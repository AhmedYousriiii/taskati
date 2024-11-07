import 'package:flutter/material.dart';
import 'package:taskati/core/constant/App_fonts.dart';
import 'package:taskati/core/utils/color.dart';

TextStyle getTitleTextStyle({double? fontsize, FontWeight? fontWeight, Color? color}) {
  return TextStyle(
    fontSize: fontsize ?? 24,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? Colors.black,
    fontFamily: AppFonts.poppins,
  );
}

TextStyle getprimaryTextStyle({double? fontsize, FontWeight? fontWeight, Color? color}) {
  return TextStyle(
    fontSize: fontsize ?? 18,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? GetColor.primarycolor,
    fontFamily: AppFonts.poppins,
  );
}

TextStyle getsubTitleTextStyle({double? fontsize, FontWeight? fontWeight, Color? color}) {
  return TextStyle(
    fontSize: fontsize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? GetColor.blackcolor,
    fontFamily: AppFonts.poppins,
  );
}

TextStyle gettextbutton({double? fontsize, FontWeight? fontWeight, Color? color}) {
  return TextStyle(
    fontSize: fontsize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? Colors.white,
    fontFamily: AppFonts.poppins,
  );
}
