
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomunderLineText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const CustomunderLineText({
    super.key, required this.text, this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:style ?? regularFontStyle(
            color: AppColors.underlineColor,
            decoration: TextDecoration.underline,
            size: 16));
  }
}