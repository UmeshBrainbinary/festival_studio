import 'package:festiveapp_studio/common/common_back_button.dart';
import 'package:festiveapp_studio/common/common_primary_button.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/card_download/card_download_controller.dart';
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CardDownload extends StatelessWidget {
  CardDownload({super.key});

  CardDownloadController controller = Get.put(CardDownloadController());

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
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Diwali Art 1',
                  style: boldFontStyle(color: AppColors.blackColor, size: 18),
                ),
                const Spacer(),
                SvgPicture.asset(
                  AppAssets.edit,
                  height: 20,
                  width: 20,

                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.black12,
                      offset: Offset(2, 2),
                    )
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(AppAssets.card,fit: BoxFit.fill,)
              ),
            ),
            const Spacer(),
            CommonPrimaryButton(onTap: () {}, text: StringRes.removeWaterMark),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                commonButtonCard(
                    width: 150,
                    text: StringRes.download,
                    image: AppAssets.download),
                const Spacer(),
                InkWell(
                  onTap: () async {
                    controller.share();
                  },
                  child: commonButtonCard(
                      width: 150,
                      text: StringRes.share,
                      image: AppAssets.share),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
