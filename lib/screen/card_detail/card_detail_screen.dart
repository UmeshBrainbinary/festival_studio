import 'package:cached_network_image/cached_network_image.dart';
import 'package:festiveapp_studio/common/common_back_button.dart';
import 'package:festiveapp_studio/common/status_bar.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/add_details/widget/add_details_widget.dart';
import 'package:festiveapp_studio/screen/card_detail/cart_detail_controller.dart';
import 'package:festiveapp_studio/screen/card_download/card_dowload_screen.dart';
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CardDetailScreen extends StatelessWidget {
  String name;
  String images;
  CardDetailScreen({super.key,required this.name,required this.images});
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
                      Container(
                       // width: width * 0.73,
                        height: height * 0.55,
                        width:width *0.6,
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
                              height: height * 0.55,
                              width:width *0.5,
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
                      SizedBox(height: height * 0.025),
                      Obx(
                        ()=>controller.selectedIndex.value  == 1 ?
                        SizedBox(
                          height: height * 0.38,
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            separatorBuilder: (context, index) {
                              return SizedBox(width: width * 0.02);
                            },
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  darkStatusBar();
                                  Get.to(() => CardDetailScreen(name:name,images: images,))?.whenComplete(()=> darkStatusBar());
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 200,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(AppAssets.card1,)),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ) : SizedBox(),
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
