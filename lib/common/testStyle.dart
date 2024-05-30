
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';



TextStyle hintStyle =
    const TextStyle(fontSize: 14, color: AppColors.white, /*fontFamily: Fonts.inter, */fontWeight: FontWeight.w400);


TextStyle semiBoldFontStyle({double? size, String? family, Color? color}) {
  return TextStyle(
      fontSize: size ?? 12,
      // fontFamily: family ?? Fonts.inter,
      fontWeight: FontWeight.w600,
      color: color ?? AppColors.white);
}

TextStyle mediumFontStyle({double? size, String? family, Color? color, double? height}) {
  return TextStyle(
      fontSize: size ?? 12,
      // fontFamily: family ?? Fonts.inter,
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.white,
      height: height);
}


///      ---------------    NEW    -------------------

TextStyle regularFontStyle({double? size, String? family, Color? color, double? height}) {
  return TextStyle(
      fontSize: size ?? 12,
      // fontFamily: family ?? Fonts.inter,
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.white,
      height: height);
}

TextStyle boldFontStyle({double? size, String? family, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: size ?? 12,
    // fontFamily: family ?? Fonts.inter,
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color ?? AppColors.white,
  );
}
