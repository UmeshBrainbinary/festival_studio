
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonBackButton extends StatelessWidget {
  final VoidCallback onTap;
  const CommonBackButton({
    super.key,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Get.width * 0.025),
        decoration: const BoxDecoration(
            color: AppColors.white, shape: BoxShape.circle),
        child: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: AppColors.blackColor,
          size: 16,
        ),
      ),
    );
  }
}