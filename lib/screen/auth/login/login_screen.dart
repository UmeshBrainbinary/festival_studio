import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: AppColors.blue,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.035),
        child: Column(
          children: [
            SizedBox(height: height*0.08,width: width),
            Image.asset(AppAssets.logo,height: height*0.15,width: height*0.15),
            SizedBox(height: height*0.015),
            Text(StringRes.loginToYourAcc,style: boldFontStyle(size: 28),),
            SizedBox(height: height*0.015),
            Text(StringRes.takeYourBrandToTheNextLevel,style: regularFontStyle(size: 16,color:
            AppColors.errorColor),),
          ],
        ),
      ),

    );
  }
}
