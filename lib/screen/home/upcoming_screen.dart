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
import 'package:intl/intl.dart';

class UpcomingScreen extends StatefulWidget {
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
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  DateFormat dateFormat = DateFormat("dd, MMMM yyyy");
  @override
  void initState() {
    init();
    super.initState();
  }

List grid =[];
  init(){
    if(widget.isSub == false){


      setState(() {

      });
      widget.items.forEach((e){
        e.postImg.forEach((ey){
          grid.add({
            "date":e.date,
            "description":e.description,
            "image":ey['url'] ?? '',
          });
        });
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
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
                    widget.name,
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
            (widget.isSub)
                ? Expanded(
                    child: ListView.builder(
                      itemCount: widget.subData.length,
                      itemBuilder: (context, index) {
                        return widget.subData[index].posts.length !=0? Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.subData[index].subCategory ?? '',
                                  style: boldFontStyle(
                                      color: AppColors.white, size: 16),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {

                                    lightStatusBar();
                                   Get.to(()=>UpcomingSubScreen(name:   widget.subData[index].subCategory ?? '',items: widget.subData[index].posts,
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
                              itemCount: widget.subData[index].posts.length<=3?widget.subData[index].posts.length:3,
                              itemBuilder: (context,i){
                                return  Row(
                                  children: List.generate(widget.subData[index].posts[i].postImg.length, (y)=> GestureDetector(
                                    onTap: () {
                                  darkStatusBar();
                                  Get.to(() => CardDetailScreen(
                                    name: widget.subData[index].subCategory ?? '',
                                    images: widget.subData[index].posts[i].postImg[y]['url'] ?? '',
                              date:
                              dateFormat.format( widget.subData[index].posts[i].date ??
                                  DateTime.now(),),
                                    description: widget.subData[index].posts[i].description ?? '',
                                  ))?.whenComplete(()=> lightStatusBar());
                                },
                                child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 230,
                                  width: 130,
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                imageUrl:
                                widget.subData[index].posts[i].postImg[y]['url'] ?? '',
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
                                )),
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
                      itemCount:grid.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.55,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            darkStatusBar();
                            Get.to(() => CardDetailScreen(
                                  name: widget.name,
                                  images: grid[index]
                                          ['image'] ??
                                      '',
                              date:
                              dateFormat.format(grid[index]
                              ['date'] ??
                                  DateTime.now(),),
                              description: grid[index]
                              ['description'] ??
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
                                  imageUrl: grid[index]
                                  ['image'] ??
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
