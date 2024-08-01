// ignore_for_file: prefer_is_empty

import 'package:cached_network_image/cached_network_image.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/card_detail/card_detail_screen.dart';
import 'package:festiveapp_studio/screen/home/home_controller.dart';
import 'package:festiveapp_studio/screen/home/morning_quotes.dart';
import 'package:festiveapp_studio/screen/home/motivational_screen.dart';
import 'package:festiveapp_studio/screen/home/upcoming_screen.dart';
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

HomeController controller = Get.find<HomeController>();

Widget textField() {
  return Container(
    height: 48,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: AppColors.white,
    ),
    child: TextField(
      controller: controller.search,
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 5.0,top: 13,bottom: 13),
            child: Image.asset(AppAssets.search),
          ),
          hintText: StringRes.search,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 13.0,bottom: 13),
            child: SvgPicture.asset(AppAssets.voice),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
      ),
    ),
  );
}

Widget festivalListview({context,index}) {
  bool isBox = false;
  if( controller.homeModel[index].postsGroupedBySubCategory?.length !=0){
    controller.homeModel[index].postsGroupedBySubCategory?.forEach((e){
      if(e.posts?.length != 0)
        {
         isBox =true;
        }
    });
  }
  return (controller.homeModel[index].postsWithoutSubCategory?.length !=0) || (controller.homeModel[index].postsGroupedBySubCategory?.length !=0  && isBox) ?
  SizedBox(
    height: 305,
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              controller.homeModel[index].category ?? '',
              style: boldFontStyle(color: AppColors.white, size: 16),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                // Get.to(MorningQuotes());
                Navigator.push(context, MaterialPageRoute(builder: (context)=>  UpcomingScreen(name:   controller.homeModel[index].category ?? '',items: controller.homeModel[index],
                isSub: controller.homeModel[index].postsGroupedBySubCategory?.length != 0? true:false
                ),
                ));
              },
              child: Row(
                children: [
                  Text(
                    StringRes.more,
                    style: boldFontStyle(color: AppColors.white, size: 16),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(Icons.arrow_forward_ios_sharp,
                      color: AppColors.white, size: 20),
                ],
              ),
            )

          ],
        ),
        const SizedBox(height: 5,),

        controller.homeModel[index].postsWithoutSubCategory?.length !=0 ?
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:  controller.homeModel[index].postsWithoutSubCategory?.length ?? 0,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: (){
                  Get.to(()=>CardDetailScreen(name: controller.homeModel[index].category ?? '',images: controller.homeModel[i].postsWithoutSubCategory?[i].postImg?.url ?? '',));

                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(

                    children: [
                      Container(
                        height: 250,
                        width: 150,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl:  controller.homeModel[index].postsWithoutSubCategory?[i].postImg?.url ?? '',
                              height: 250,
                              width: 150,
                              fit: BoxFit.fill,
                              placeholder: (context,i){
                                return Container();
                              },
                              errorWidget:  (context,i,r){
                                return Container();
                              },
                            )),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ):
        controller.homeModel[index].postsGroupedBySubCategory?.length !=0?
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:  controller.homeModel[index].postsGroupedBySubCategory?.length ?? 0,
            itemBuilder: (context, i) {

              return  ListView.builder(
              itemCount:  controller.homeModel[index].postsGroupedBySubCategory?[i].posts?.length ?? 0,
                itemBuilder: (context,y) {
                  return GestureDetector(
                    onTap: (){
                      Get.to(()=>CardDetailScreen(name: controller.homeModel[index].postsGroupedBySubCategory?[i].subCategory ?? '',images: controller.homeModel[index].
                      postsGroupedBySubCategory?[i].posts?[y].postImg?.url ?? '',));

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(

                        children: [
                          Container(
                            height: 250,
                            width: 150,
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl:controller.homeModel[index].
                                  postsGroupedBySubCategory?[i].posts?[y].postImg?.url ?? '',
                                  height: 250,
                                  width: 150,
                                  fit: BoxFit.fill,
                                  placeholder: (context,i){
                                    return Container();
                                  },
                                  errorWidget:  (context,i,r){
                                    return Container();
                                  },
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              );
            },
          ),
        ):const SizedBox(),
      ],
    ),
  ):const SizedBox();
}

/*Widget motivationalListview({context}) {
  return SizedBox(
    height: 305,
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              StringRes.motivational,
              style: boldFontStyle(color: AppColors.white, size: 16),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                // Get.to(MorningQuotes());
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const MotivationalScreen(),
                ));
              },
              child: Row(
                children: [
                  Text(
                    StringRes.more,
                    style: boldFontStyle(color: AppColors.white, size: 16),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(Icons.arrow_forward_ios_sharp,
                      color: AppColors.white, size: 20),
                ],
              ),
            )

          ],
        ),
        const SizedBox(height: 5,),

        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(()=>CardDetailScreen(name:StringRes.festival,images: '',));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(AppAssets.card,)
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget morningQuotes({context}) {
  return SizedBox(
    height: 305,
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              StringRes.morningQuotes,
              style: boldFontStyle(color: AppColors.white, size: 16),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
               // Get.to(MorningQuotes());
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const MorningQuotes(),
                ));
              },
              child: Row(
                children: [
                  Text(
                    StringRes.more,
                    style: boldFontStyle(color: AppColors.white, size: 16),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(Icons.arrow_forward_ios_sharp,
                      color: AppColors.white, size: 20),
                ],
              ),
            )

          ],
        ),
        const SizedBox(height: 5,),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(()=>CardDetailScreen(name:StringRes.festival,images: '',));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(AppAssets.card,)
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}*/
