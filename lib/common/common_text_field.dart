import 'package:auto_size_text/auto_size_text.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final double? height;
  final int? maxLines;
  final String? hint;
  final bool? showPwd;
  final VoidCallback? onHideButtonTap;
  final Widget? leadingWidget;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;

  // final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormator;

  const CommonTextField(
      {super.key,
      required this.controller,
      this.hint,
      this.leadingWidget,
      this.height,
      this.maxLines,
      this.showPwd,
      this.onHideButtonTap,
      this.textInputType,
      this.textInputAction,
      this.inputFormator});

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
            width: Get.width * 0.360,
            child: leadingWidget ??
               Text(
                  hint ?? "",
                  maxLines: 1,
                  style: mediumFontStyle(color: AppColors.hintColor, size: 16),
                ),
          ),
          Expanded(
            child: TextFormField(
              maxLines: maxLines,
              controller: controller,
              keyboardType: textInputType,
              textInputAction: textInputAction,
              // validator: validator,
              inputFormatters: inputFormator,
              // style: mediumFontStyle(color: AppColors.blackColor,size: 16,height: 1.3),
              // decoration: InputDecoration(border: InputBorder.none,hintStyle: mediumFontStyle(color: AppColors.hintColor,size: 16)),
obscureText:  showPwd != null ? showPwd!:false,
              style: mediumFontStyle(
                  color: AppColors.blackColor, size: 16, height: 1.3),
              decoration: InputDecoration(

                border: InputBorder.none,
                hintStyle:
                    mediumFontStyle(color: AppColors.hintColor, size: 16),
                  contentPadding: EdgeInsets.only(top: 12),
                  suffixIcon: showPwd != null /*&& controller.text != ''*/
                      ? InkWell(
                    onTap: onHideButtonTap,
                    child: Icon(
                      (showPwd == false)
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.hintColor,
                    ),
                  ):const SizedBox()
              ),
            ),
          ),
        ],
      ),
    );
  }
}
