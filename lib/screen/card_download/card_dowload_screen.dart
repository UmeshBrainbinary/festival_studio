import 'package:cached_network_image/cached_network_image.dart';
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
  String name;
  String images;
  CardDownload({super.key,required this.name,required this.images});

  CardDownloadController controller = Get.put(CardDownloadController());

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
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
                  name,
                  style: mediumFontStyle(color: AppColors.color0f1c10, size: 16),
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
              height: height * 0.55,
              width:width *0.7,
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
                  borderRadius: BorderRadius.circular(8),
                  child:CachedNetworkImage(
                    imageUrl: images,
                    height: 300,
                    width: 200,
                    fit: BoxFit.fill,
                    placeholder: (context,i){
                      return Container();
                    },
                    errorWidget:  (context,i,r){
                      return Container();
                    },
                  )
              ),
            ),
            const SizedBox(
              height: 40,
            ),
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
