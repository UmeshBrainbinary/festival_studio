import 'package:festiveapp_studio/common/common_back_button.dart';
import 'package:festiveapp_studio/common/common_primary_button.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/select_logo/select_logo_controller.dart';
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LogoSelectionPage extends StatelessWidget {
  final LogoController controller = Get.put(LogoController());

  final List<String> logos = [
    AppAssets.logoFestival,
    AppAssets.logo1,
    AppAssets.logo2,
    AppAssets.logoFestival,
    AppAssets.logo1,
    AppAssets.logo2,
  ];

   LogoSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundCard,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CommonBackButton(
                  onTap: () {
                    Get.back();
                  },
                ),
                const Spacer(),
                Text(
                  StringRes.selectLogo,
                  style: boldFontStyle(size: 18, color: AppColors.blackColor),
                ),
                const Spacer(),
                Visibility(
                  visible: false,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: CommonBackButton(
                    onTap: () {

                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 15.0,
                  ),
                  itemCount: logos.length,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      bool isSelected = controller.isSelected(index);
                      return GestureDetector(
                        onTap: () {
                          controller.selectLogo(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.blackColor.withOpacity(0.2),
                                blurRadius: 6,

                              )
                            ]
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Padding(
                                  padding: const EdgeInsets.all(50.0),
                                  child: SvgPicture.asset(
                                    logos[index],
                                  ),
                                ),
                              ),
                              if (isSelected)
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 28,
                                      width: 28,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: AppColors.lightPink,
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.done,
                                          color: AppColors.white,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),

                      );
                    });
                  },
                ),
              ),
            ),
            CommonPrimaryButton(onTap: () {}, text: StringRes.select)
          ],
        ),
      ),
    );
  }
}
