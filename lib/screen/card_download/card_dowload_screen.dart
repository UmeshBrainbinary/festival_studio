// ignore_for_file: must_be_immutable


import 'dart:typed_data';

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
  Uint8List? images;
  CardDownload({super.key,required this.name,required this.images});

  CardDownloadController controller = Get.put(CardDownloadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundCard,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
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
                  SizedBox(
                    width: Get.width *0.6,
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: mediumFontStyle(color: AppColors.color0f1c10, size: 16),
                    ),
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
                height: 400,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow:  [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(3, 3),
                        color: Colors.black.withOpacity(0.4),

                      )
                    ]),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child:(images != null)?Image.memory(images!, height: 400,
                        width: 250,
                        fit: BoxFit.fill,

                    ):const SizedBox()
                    // CachedNetworkImage(
                    //   imageUrl: images,
                    //   height: 400,
                    //   width: 250,
                    //   fit: BoxFit.fill,
                    //   placeholder: (context,i){
                    //     return Container();
                    //   },
                    //   errorWidget:  (context,i,r){
                    //     return Container();
                    //   },
                    // )
                ),
              ),
              const SizedBox(
                height: 20,
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
              ),
              const SizedBox(
                height: 40,
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
