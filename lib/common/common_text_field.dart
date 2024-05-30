import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  double? height;
  int? maxLines;
  final String? hint;
  final Widget? leadingWidget;

  CommonTextField(
      {super.key,
      required this.controller,
      this.hint,
      this.leadingWidget,
      this.height,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 48,
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.035),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColors.white),
      child: Row(
        children: [
          SizedBox(
            width: Get.width * 0.22,
            child: leadingWidget ??
                Text(
                  hint ?? "",
                  style: mediumFontStyle(color: AppColors.hintColor, size: 16),
                ),
          ),
          Expanded(
            child: TextFormField(
              maxLines: maxLines,
              controller: controller,
              style: mediumFontStyle(
                  color: AppColors.blackColor, size: 16, height: 1.3),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle:
                    mediumFontStyle(color: AppColors.hintColor, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
