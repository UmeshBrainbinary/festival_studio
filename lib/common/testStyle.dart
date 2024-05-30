import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';

TextStyle hintStyle = const TextStyle(
    fontSize: 14,
    color: AppColors.white,
    /*fontFamily: Fonts.inter, */
    fontWeight: FontWeight.w400);

TextStyle semiBoldFontStyle({double? size, String? family, Color? color,double? height}) {
  return TextStyle(
      fontSize: size ?? 12,
      // fontFamily: family ?? Fonts.inter,
      fontWeight: FontWeight.w600,
      height: height,
      color: color ?? AppColors.white);
}

TextStyle mediumFontStyle(
    {double? size, String? family, Color? color, double? height,TextDecoration? decoration}) {
  return TextStyle(
      fontSize: size ?? 12,
      // fontFamily: family ?? Fonts.inter,
      fontWeight: FontWeight.w500,
      color: color ?? AppColors.white,
      height: height,decoration: decoration,decorationColor: color);
}

///      ---------------    NEW    -------------------

TextStyle regularFontStyle(
    {double? size, String? family, Color? color, double? height,TextDecoration? decoration}) {
  return TextStyle(
      fontSize: size ?? 12,
      // fontFamily: family ?? Fonts.inter,
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.white,
      height: height,decoration: decoration,decorationColor: color);
}

TextStyle boldFontStyle(
    {double? size, String? family, Color? color, FontWeight? fontWeight, double? height}) {
  return TextStyle(
    fontSize: size ?? 12,
    // fontFamily: family ?? Fonts.inter,
    fontWeight: fontWeight ?? FontWeight.w700,
    color: color ?? AppColors.white,
    height: height,
  );
}
