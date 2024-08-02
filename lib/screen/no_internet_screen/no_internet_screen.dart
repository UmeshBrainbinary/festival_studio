
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            Image.asset(AppAssets.wifi,scale: 2,),
            const SizedBox(
              height: 30,
            ),
            Text(
              StringRes.noInternet,
              textAlign: TextAlign.center,
              style: mediumFontStyle(size: 16, color: AppColors.lightPink),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: onTap,
              child: Text(
                StringRes.tryAgain,
                style: mediumFontStyle(size: 14, color: AppColors.lightGreyTextColor),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
