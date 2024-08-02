import 'package:festiveapp_studio/common/common_back_button.dart';
import 'package:festiveapp_studio/common/status_bar.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/faq/faq_screen.dart';
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundCard,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CommonBackButton(
                  onTap: () {
                    Get.back();
                  },
                ),
                const Spacer(),
                Text(
                  StringRes.helpSupport,
                  style: boldFontStyle(color: AppColors.blackColor, size: 18),
                ),
                const Spacer(),
                Visibility(
                  visible: false,
                  maintainSize: true,
                   maintainAnimation: true,
                  maintainState: true,
                  child: CommonBackButton(
                    onTap: () {

                    },
                  ),
                ),

              ],
            ),
           Expanded(
             child: ListView(
               children: [
                 Column(
                   children: [
                     const SizedBox(
                       height: 20,
                     ),
                     buildCircleAvatar(),
                     const SizedBox(
                       height: 20,
                     ),
                     Text(
                       StringRes.hello,
                       textAlign: TextAlign.center,
                       style: mediumFontStyle(color: AppColors.blackColor, size: 18),
                     ),
                     const SizedBox(height: 30,),
                     buildContainer(
                       image: AppAssets.chat,
                       text: 'Contact Live Chat',
                       assetName: AppAssets.rightArrow,
                     ),
                     const SizedBox(height: 20,),
                     buildContainer(
                       image: AppAssets.call,
                       text: 'Call Now',
                       assetName: AppAssets.rightArrow,
                     ),
                     const SizedBox(height: 20,),
                     buildContainer(
                       image: AppAssets.email,
                       text: 'Send us an E-mail',
                       assetName: AppAssets.rightArrow,
                     ),
                     const SizedBox(height: 20,),
                     InkWell(
                      onTap: (){
                        Get.to(()=> FaqScreen());
                      },
                       child: buildContainer(
                         image: AppAssets.support,
                         text: 'FAQs',
                        assetName: AppAssets.downArrow,
                         height: 10,
                         width: 10
                       ),
                     ),
                     const SizedBox(height: 20,),

                   ],
                 ),
               ],
             ),
           )
          ],
        ),
      ),
    );
  }

  Container buildContainer(
      {required String image, required String text,  required String assetName,double? height,double? width}) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.white),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 20,
              width: 20,
              color: AppColors.hintColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: mediumFontStyle(color: AppColors.hintColor,size: 14),
            ),
            const Spacer(),
            SvgPicture.asset(assetName,height:height ,width: width,),

          ],
        ),
      ),
    );
  }

  Widget buildCircleAvatar() {
    return  Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100)
      ),
      child: SvgPicture.asset(AppAssets.help),
    );
  }
}
