// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:festiveapp_studio/common/common_back_button.dart';
import 'package:festiveapp_studio/common/common_loader.dart';
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
import 'package:screenshot/screenshot.dart';
class CardDetailScreen extends StatefulWidget {
  String name;
  String images;
  String date;
  String description;
  CardDetailScreen({super.key,required this.name,required this.images,required this.date,required this.description});

  @override
  State<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> {
  CardDetailController controller = Get.put(CardDetailController());

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteBg,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GetBuilder<CardDetailController>(
              id: "frame",
              builder: (context) {
                return Column(
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
                        SizedBox(
                          width: Get.width *0.6,

                          child: Text(widget.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: mediumFontStyle(
                                  size: 16, color: AppColors.color0f1c10)),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () async{
                            await controller.edit(context);
                            setState((){
                              controller.selectedImage = controller.selectedImage;
                            });
                          },
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
                              Screenshot(
                                controller: controller.screenshotController,
                                child: Column(
                                  children: [

                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          // width: width * 0.73,
                                          height: 400,
                                          width:250,
                                          //padding: EdgeInsets.all(width * 0.025),
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.4),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: const Offset(3, 3),
                                              ),
                                            ],
                                          ),

                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8),
                                              child:CachedNetworkImage(
                                                imageUrl: widget.images,
                                                height: 400,
                                                width:250,
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
                                            width:250,
                                            alignment: Alignment.center,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8),
                                              child: CustomColorMappedSvg(
                                                assetName: controller.selectedImage!,
                                                website: PrefService.getString(PrefKeys.website),
                                                date: widget.date,
                                                description: widget.description,
                                                dateColor:   PrefService.getInt(PrefKeys.dateColor) == 0?
                                                PrefService.getInt(PrefKeys.primaryColor) == 0?Colors.black:   Color(PrefService.getInt(PrefKeys.primaryColor)):
                                                Color(PrefService.getInt(PrefKeys.dateColor)),
                                                desColor: PrefService.getInt(PrefKeys.desColor)== 0?PrefService.getInt(PrefKeys.primaryColor) == 0?Colors.black:
                                                Color(PrefService.getInt(PrefKeys.primaryColor)):
                                                Color(PrefService.getInt(PrefKeys.desColor)),
                                                webColor: PrefService.getInt(PrefKeys.webColor)== 0?PrefService.getInt(PrefKeys.primaryColor) == 0?Colors.black:
                                                Color(PrefService.getInt(PrefKeys.primaryColor)):
                                                Color(PrefService.getInt(PrefKeys.webColor)),

                                                primaryColor:   PrefService.getInt(PrefKeys.primaryColor) == 0?Colors.black:   Color(PrefService.getInt(PrefKeys.primaryColor)),
                                                secondaryColor: PrefService.getInt(PrefKeys.secondaryColor)== 0?Colors.black:   Color(PrefService.getInt(PrefKeys.secondaryColor)),

                                                //   colorMap: {
                                                //     const Color(0xff383838):
                                                // PrefService.getInt(PrefKeys.primaryColor) == 0?Colors.black:   Color(PrefService.getInt(PrefKeys.primaryColor)), // Black to Red
                                                //     const Color(0xff6d4d26):
                                                //    PrefService.getInt(PrefKeys.secondaryColor)== 0?Colors.black:   Color(PrefService.getInt(PrefKeys.secondaryColor)), // White to Green
                                                //   },
                                              ),
                                            ))
                                            : const SizedBox(),
                                      ],
                                    )


                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.025),
                              Obx(
                                    ()=>controller.selectedIndex.value  == 1 ?
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: SizedBox(
                                    height: 150,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child:Row(
                                        children: List.generate(
                                            controller.framesList.length,
                                                (index) => InkWell(
                                              onTap: () async {

                                                controller.selectedImage = controller.framesList[index];
                                                controller.update(['frame']);
                                                controller.screenshotController.capture().then((image){
                                                  controller.imageNew =image;
                                                  controller.update(['frame']);

                                                });
                                                setState(() {

                                                });
                                              },
                                              child: Stack(
                                                alignment: Alignment.centerRight,
                                                children: [
                                                  Container(
                                                    height: 150,
                                                    width: 150,

                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child:   Center(
                                                        child: SvgPicture.string(
                                                          controller.framesList[index],
                                                          height: 150,
                                                          width: 150,
                                                        )),
                                                  ),
                                                  controller.selectedImage == controller.framesList[index]? Align(
                                                    alignment: Alignment.topRight,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(right: 25.0),
                                                      child: Container(
                                                        height: 20,
                                                        width: 20,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(50),
                                                          color: AppColors.lightPink,
                                                        ),
                                                        child: const Center(
                                                          child: Icon(
                                                            Icons.done,
                                                            color: AppColors.white,
                                                            size: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ):const SizedBox(),
                                                ],
                                              ),
                                            )),
                                      )
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
                                  ),
                                ) : const SizedBox(),
                              ),
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
                                  onTap: () async {
                                    await darkStatusBar();
                                    await controller.screenshotController.capture().then((v){
                                      controller.imageNew =v;
                                    });
                                    setState(() {

                                    });
                                    Get.to(()=> CardDownload(name:widget.name,images:controller.imageNew))?.whenComplete(()=> darkStatusBar())
                                        .then((v){

                                    controller.selectedIndex.value = 1;
                                    });
                                    controller.selectedIndex.value =2;
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
                );
              }
            ),
            Obx(()=> controller.loader.value ?const CommonLoader():const SizedBox()),

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
