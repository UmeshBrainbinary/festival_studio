import 'package:cached_network_image/cached_network_image.dart';
import 'package:festiveapp_studio/common/common_back_button.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/card_detail/card_detail_screen.dart';
import 'package:festiveapp_studio/screen/home/api/home_model.dart';
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingScreen extends StatelessWidget {
  String name;
  HomeModel items;
  bool isSub;
   UpcomingScreen({super.key,required this.name,required this.items,required this.isSub});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CommonBackButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                Text(
                  name,
                  style: boldFontStyle(color: AppColors.white, size: 18),
                ),
                const Spacer(),
              ],
            ),
            (isSub)?
           Expanded(
             child: ListView.builder(
             
               itemCount: items.postsGroupedBySubCategory?.length ?? 0,
               itemBuilder: (context,index){
                 return  Column(
                   children: [
                     const SizedBox(
                       height: 10,
                     ),
                     Row(
                       children: [
                         Text(
                           items.postsGroupedBySubCategory?[index].subCategory ?? '',
                           style: boldFontStyle(color: AppColors.white, size: 16),
                         ),
             
                       ],
                     ),
                     const SizedBox(height: 5,),

                     items.postsGroupedBySubCategory?[index].posts?.length  !=0?  SizedBox(
                       height: 270,
                       child: ListView.builder(
                         scrollDirection: Axis.horizontal,
                         itemCount:   items.postsGroupedBySubCategory?[index].posts?.length ?? 0,
                         itemBuilder: (context, i) {
                           return GestureDetector(
                             onTap: (){
                               Get.to(()=>CardDetailScreen(name: items.postsGroupedBySubCategory?[index].subCategory ?? '',images: items.postsGroupedBySubCategory?[index].posts?[i].postImg?.url ?? '',));

                             },
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Container(
                                 height: 250,
                                 width: 150,
                                 decoration: BoxDecoration(

                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 child: ClipRRect(
                                     borderRadius: BorderRadius.circular(10),
                                     child: CachedNetworkImage(
                                       imageUrl:  items.postsGroupedBySubCategory?[index].posts?[i].postImg?.url ?? '',
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
                             ),
                           );
                         },
                       ),
                     ):const SizedBox(),
                   ],
                 );
               },
             ),
           )
                :Expanded(
              child: GridView.builder(
                itemCount: items.postsWithoutSubCategory!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Get.to(()=>CardDetailScreen(name:items.category ?? '',images: items.postsWithoutSubCategory?[index].postImg?.url ?? '',));
                    },
                    child: Container(
                      height: 250,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl:  items.postsWithoutSubCategory?[index].postImg?.url ?? '',
                          height: 250,
                          width: 150,
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
