// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:festiveapp_studio/common/common_back_button.dart';
import 'package:festiveapp_studio/common/status_bar.dart';
import 'package:festiveapp_studio/common/svgContent/customColor_change.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/card_detail/cart_detail_controller.dart';
import 'package:festiveapp_studio/screen/card_download/card_dowload_screen.dart';
import 'package:festiveapp_studio/service/pref_services.dart';
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/pref_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class CardDetailScreen extends StatelessWidget {
  String name;
  String images;
  String frame;
  CardDetailScreen({super.key,required this.name,required this.images,required this.frame});
  CardDetailController controller = Get.put(CardDetailController());
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteBg,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: height * 0.01),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: width * 0.04),
                CommonBackButton(
                  onTap: () {
                    Get.back();
                  },
                ),
                SizedBox(width: width * 0.03),
                Text(name,
                    style: mediumFontStyle(
                        size: 16, color: AppColors.color0f1c10)),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AppAssets.edit, width: width * 0.055),
                ),
                  SizedBox(width: width * 0.04),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.015),
                      GetBuilder<CardDetailController>(
                        id: "frame",
                        builder: (con) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                               // width: width * 0.73,
                                height: 400,
                                width:280,
                                //padding: EdgeInsets.all(width * 0.025),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),

                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child:CachedNetworkImage(
                                      imageUrl: images,
                                      height: 400,
                                      width:350,
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
                             (controller.selectedImage != null)
                                 ? Container(
                                 height: 400,
                                 width:350,
                                 alignment: Alignment.center,
                                 child: ClipRRect(
                                   borderRadius: BorderRadius.circular(8),
                                   child: CustomColorMappedSvg(
                                     assetName: controller.selectedImage!,
                                     website: PrefService.getString(PrefKeys.website),
                                     date: PrefService.getString(PrefKeys.brandName),
                                     description: '',
                                     colorMap: {
                                       const Color(0xff383838):
                                   PrefService.getInt(PrefKeys.primaryColor) == 0?Colors.black:   Color(PrefService.getInt(PrefKeys.primaryColor)), // Black to Red
                                       const Color(0xff6d4d26):
                                      PrefService.getInt(PrefKeys.secondaryColor)== 0?Colors.black:   Color(PrefService.getInt(PrefKeys.secondaryColor)), // White to Green
                                     },
                                   ),
                                 ))
                                 : const SizedBox(),
                            ],
                          );
                        }
                      ),
                      SizedBox(height: height * 0.025),
                      Obx(
                        ()=>controller.selectedIndex.value  == 1 ?
                        SizedBox(
                          height: 150,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  controller.framesList.length,
                                      (index) => InkWell(
                                        onTap: () async {

                                          controller.selectedImage = controller.framesList[index];
                                          controller.update(['frame']);
                                        },
                                        child: Container(
                                          height: 150,
                                          width: 150,

                                          alignment: Alignment.center,
                                          child: Center(
                                              child: SvgPicture.string(
                                                controller.framesList[index],
                                                height: 150,
                                                width: 150,
                                                fit: BoxFit.fill,
                                              )),
                                        ),
                                      )),
                            ),
                          ),
                          // child: InkWell(
                          //   onTap: () async {
                          //     final response = await http.get(Uri.parse(frame));
                          //
                          //     if (response.statusCode == 200) {
                          //       controller.selectedImage = response.body;
                          //       controller.update(['frame']);
                          //     } else {
                          //
                          //     }
                          //   },
                          //   child: SvgPicture.network(
                          //   frame,
                          //     height: 150,
                          //     width: 150,
                          //     fit: BoxFit.fill,
                          //   ),
                          // ),
                        ) : const SizedBox(),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 57,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: width*0.07),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  color: AppColors.lightPink,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                    ()=> customIconWidget(
                         assetName: AppAssets.home,
                          isSelected: controller.selectedIndex.value == 0,
                          onTap: () {
                            controller.selectedIndex.value = 0;
                          }),
                    ),
                    Obx(
                            ()=> customIconWidget(
                                assetName: AppAssets.them,
                          isSelected: controller.selectedIndex.value == 1,
                          onTap: () {
                            controller.selectedIndex.value = 1;
                          }),
                    ),
                    Obx(
                            ()=> customIconWidget(
                         assetName: AppAssets.download,
                          isSelected: controller.selectedIndex.value == 2,
                          onTap: () {
                            darkStatusBar();
                            Get.to(()=> CardDownload(name:name,images:images))?.whenComplete(()=> darkStatusBar());
                            controller.selectedIndex.value = 2;
                          }),
                    ),
                    Obx(
                            ()=> customIconWidget(
                          assetName: AppAssets.share,
                          isSelected: controller.selectedIndex.value == 3,
                          onTap: () {
                            controller.share();
                            controller.selectedIndex.value = 3;
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customIconWidget(
      {required String assetName,
      required bool isSelected,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.white : Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(assetName,
                color: isSelected ? AppColors.lightPink : AppColors.white),
          ),
        ),
      ),
    );
  }
}
