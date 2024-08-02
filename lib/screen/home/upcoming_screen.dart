// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:festiveapp_studio/common/common_back_button.dart';
import 'package:festiveapp_studio/common/status_bar.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/card_detail/card_detail_screen.dart';
import 'package:festiveapp_studio/screen/home/upcomin_subcategory_screen.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingScreen extends StatelessWidget {
  String name;
  List items;
  List subData;
  bool isSub;
  UpcomingScreen(
      {super.key,
      required this.name,
      required this.items,
      required this.subData,
      required this.isSub});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonBackButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                Container(
                  width: Get.width *0.5,
                 alignment: Alignment.center,
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: boldFontStyle(color: AppColors.white, size: 18),
                  ),
                ),

                Visibility(
                 visible: false,
                  maintainState: true,
                  maintainAnimation: true,
                  maintainSize: true,
                  child: CommonBackButton(
                    onTap: () {

                    },
                  ),
                ),
              ],
            ),
            (isSub)
                ? Expanded(
                    child: ListView.builder(
                      itemCount: subData.length,
                      itemBuilder: (context, index) {
                        return subData[index].posts.length !=0? Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  subData[index].subCategory ?? '',
                                  style: boldFontStyle(
                                      color: AppColors.white, size: 16),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {

                                    lightStatusBar();
                                   Get.to(()=>UpcomingSubScreen(name:   subData[index].subCategory ?? '',items: subData[index].posts,
                                       subData :const [],
                                       isSub: false
                                   ))?.whenComplete(()=> lightStatusBar());
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
                            const SizedBox(
                              height: 5,
                            ),
                              SizedBox(
                            height:220,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: subData[index].posts.length<=3?subData[index].posts.length:3,
                              itemBuilder: (context,i){
                                return   GestureDetector(
                                  onTap: () {
                                    darkStatusBar();
                                    Get.to(() => CardDetailScreen(
                                      name: subData[index].subCategory ?? '',
                                      images: subData[index].posts[i].postImg?.url ?? '',
                                    ))?.whenComplete(()=> lightStatusBar());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 200,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                            subData[index].posts[i].postImg?.url ?? '',
                                            height: 200,
                                            width: 200,
                                            fit: BoxFit.fill,
                                            placeholder: (context, i) {
                                              return Container();
                                            },
                                            errorWidget: (context, i, r) {
                                              return Container();
                                            },
                                          )),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                          ],
                        ):const SizedBox();
                      },
                    ),
                  )
                : Expanded(
                    child: GridView.builder(
                      itemCount: items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.7,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            darkStatusBar();
                            Get.to(() => CardDetailScreen(
                                  name: name,
                                  images: items[index]
                                          .postImg?.url ??
                                      '',
                                ))?.whenComplete(()=> lightStatusBar());
                          },
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: items
                                          [index]
                                          .postImg
                                          ?.url ??
                                      '',
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.fill,
                                  placeholder: (context, i) {
                                    return Container();
                                  },
                                  errorWidget: (context, i, r) {
                                    return Container();
                                  },
                                )),
                          ),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
