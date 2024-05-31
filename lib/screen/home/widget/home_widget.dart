import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/home/home_controller.dart';
import 'package:festiveapp_studio/screen/home/morning_quotes.dart';
import 'package:festiveapp_studio/screen/home/motivational_screen.dart';
import 'package:festiveapp_studio/screen/home/upcoming_screen.dart';
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
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
          prefixIcon: AppAssets.search,
          hintText: StringRes.search,
          suffixIcon: AppAssets.mic,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          )),
    ),
  );
}

Widget festivalListview({context}) {
  return SizedBox(
    height: 310,
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              StringRes.festival,
              style: boldFontStyle(color: AppColors.white, size: 18),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                // Get.to(MorningQuotes());
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const UpcomingScreen(),
                ));
              },
              child: Row(
                children: [
                  Text(
                    StringRes.more,
                    style: boldFontStyle(color: AppColors.white, size: 18),
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
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
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
                          child: Image.asset(
                            AppAssets.diwali,
                            fit: BoxFit.fill,
                          )),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget motivationalListview({context}) {
  return SizedBox(
    height: 310,
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              StringRes.motivational,
              style: boldFontStyle(color: AppColors.white, size: 18),
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
                    style: boldFontStyle(color: AppColors.white, size: 18),
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
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
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
                        child: Image.asset(
                          AppAssets.diwali,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
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
    height: 310,
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              StringRes.morningQuotes,
              style: boldFontStyle(color: AppColors.white, size: 18),
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
                    style: boldFontStyle(color: AppColors.white, size: 18),
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
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
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
                        child: Image.asset(
                          AppAssets.diwali,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
