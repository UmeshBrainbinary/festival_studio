// ignore_for_file: prefer_is_empty

import 'package:cached_network_image/cached_network_image.dart';
import 'package:festiveapp_studio/common/status_bar.dart';
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
      onChanged: (val){
        controller.onFilter(val);
      },
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 5.0,top: 13,bottom: 13),
            child: Image.asset(AppAssets.search),
          ),
          hintText: StringRes.search,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 13.0,bottom: 13),
            child: InkWell(
                onTap: (){
                  controller.startListening();
                },
                child: SvgPicture.asset(AppAssets.voice)),
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

  return (controller.dataShow.length !=0 &&  controller.dataShow[index]['posts'].length !=0 )? SizedBox(
    height: 305,
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: Get.width *0.6,
              child: Text(
                controller.dataShow[index]['name'] ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: boldFontStyle(color: AppColors.white, size: 16),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                // Get.to(MorningQuotes());
                lightStatusBar();
                Get.to(()=>UpcomingScreen(name:   controller.filterData[index]['name'] ?? '',items: controller.filterData[index]['posts'],
                    subData :controller.filterData[index]['subData'],
                    isSub:  controller.filterData[index]['isSub']
                ),)?.whenComplete(()=> lightStatusBar());
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

        controller.dataShow[index]['posts'] !=0 ?
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:  controller.dataShow[index]['posts'].length <=3?
            ( controller.dataShow[index]['posts'].length ?? 0):3,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: (){
                  darkStatusBar();
                  Get.to(()=>CardDetailScreen(name: controller.dataShow[index]['name'] ?? '',
                    images:controller.dataShow[index]['posts'][i].postImg?.url ?? '',))?.whenComplete(()=> lightStatusBar());

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
                              imageUrl: controller.dataShow[index]['posts'][i].postImg?.url ?? '',
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
        ):const SizedBox(),
      ],
    ),
  ):const SizedBox();
}

Widget festivalListviewFilter({context,index}) {

  return (controller.filterData.length !=0 &&  controller.filterData[index]['posts'].length !=0 )? SizedBox(
    height: 305,
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              controller.filterData[index]['name'] ?? '',
              style: boldFontStyle(color: AppColors.white, size: 16),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                // Get.to(MorningQuotes());
                lightStatusBar();
               Get.to(()=>UpcomingScreen(name:   controller.filterData[index]['name'] ?? '',items: controller.filterData[index]['posts'],
                   subData :controller.filterData[index]['subData'],
                   isSub:  controller.filterData[index]['isSub']
               ),)?.whenComplete(()=> lightStatusBar());
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

        controller.filterData[index]['posts'] !=0 ?
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:  controller.filterData[index]['posts'].length <=3?
            ( controller.filterData[index]['posts'].length ?? 0):3,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: (){
                  darkStatusBar();
                  Get.to(()=>CardDetailScreen(name: controller.filterData[index]['name'] ?? '',
                    images:controller.filterData[index]['posts'][i].postImg?.url ?? '',))?.whenComplete(()=> lightStatusBar());

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
                              imageUrl: controller.filterData[index]['posts'][i].postImg?.url ?? '',
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
