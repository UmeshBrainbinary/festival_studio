import 'package:festiveapp_studio/common/common_back_button.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/add_details/widget/add_details_widget.dart';
import 'package:festiveapp_studio/screen/card_detail/cart_detail_controller.dart';
import 'package:festiveapp_studio/screen/card_download/card_dowload_screen.dart';
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardDetailScreen extends StatelessWidget {
  CardDetailScreen({super.key});
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
            Row(
              children: [
                SizedBox(width: width * 0.04),
                CommonBackButton(
                  onTap: () {
                    Get.back();
                  },
                ),
                SizedBox(width: width * 0.03),
                Text("Diwali art 1",
                    style: mediumFontStyle(
                        size: 16, color: AppColors.color0f1c10)),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(AppAssets.logo, width: width * 0.055),
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
                        width: width * 0.73,
                        height: height * 0.65,
                        padding: EdgeInsets.all(width * 0.025),
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
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: AppColors.lightPink, width: 1.5)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWkGbIGX9ZEftT94katwzBRNErOET6ZLmKag&s",
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.025),
                      Obx(
                        ()=>controller.selectedIndex.value  == 1 ?
                        SizedBox(
                          height: height * 0.38,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            separatorBuilder: (context, index) {
                              return SizedBox(width: width * 0.02);
                            },
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => CardDetailScreen());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                            child: Image.asset(
                                              AppAssets.diwali,
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                    ],
                                  ),
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
                          icon: Icons.home_outlined,
                          isSelected: controller.selectedIndex.value == 0,
                          onTap: () {
                            controller.selectedIndex.value = 0;
                          }),
                    ),
                    Obx(
                            ()=> customIconWidget(
                          icon: Icons.color_lens_outlined,
                          isSelected: controller.selectedIndex.value == 1,
                          onTap: () {
                            controller.selectedIndex.value = 1;
                          }),
                    ),
                    Obx(
                            ()=> customIconWidget(
                          icon: Icons.download_outlined,
                          isSelected: controller.selectedIndex.value == 2,
                          onTap: () {
                            Get.to(()=> CardDownload());
                            controller.selectedIndex.value = 2;
                          }),
                    ),
                    Obx(
                            ()=> customIconWidget(
                          icon: Icons.share_outlined,
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
      {required IconData icon,
      required bool isSelected,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Get.width * 0.015),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? AppColors.white : Colors.transparent),
        child: Icon(icon,
            color: isSelected ? AppColors.lightPink : AppColors.white),
      ),
    );
  }
}
