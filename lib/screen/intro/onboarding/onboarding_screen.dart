
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/intro/onboarding/onboarding_controller.dart';
import 'package:festiveapp_studio/screen/intro/onboarding/onboarding_widget.dart';
import 'package:festiveapp_studio/utils/app_assets.dart';

import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>  with SingleTickerProviderStateMixin{


  Animation? animation;
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    );

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController!, curve: Curves.fastOutSlowIn));
    animationController!.forward();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {


    Get.put(OnBordingController());
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
       return  Scaffold(
         backgroundColor: AppColors.blue,
         body: Padding(
           padding: const EdgeInsets.all(10.0),
           child: Column(
             children: [
               const Spacer(flex: 2,),
               SizedBox(
                 height: 450,
                 child: PageView.builder(
                   controller: controller.pageController,
                   itemCount: controller.data.length,
                   onPageChanged: (value) {
                     controller.select(value);
                   },
                   itemBuilder: (context, index) {
                     return   Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         index ==0 || index ==1 ? Padding(
                           padding: const EdgeInsets.only(right: 20.0),
                           child: Align(
                             alignment: Alignment.centerRight,
                             child: Stack(
                               alignment: Alignment.topRight,
                               children: [
                                 SizedBox(
                                   height: 250,
                                   width: 250,
                                   child: SvgPicture.asset(controller.data[index]['image'],),
                                 ),


                                 index ==0?   TweenAnimationBuilder<double>(
                     tween: Tween<double>(begin: 0.0, end: 1.0),
                     curve: Curves.ease,
                     duration: const Duration(seconds: 8),
                     builder: (BuildContext context, double opacity, Widget? child) {
                     return Opacity(
                     opacity: opacity,
                     child: Image.asset(AppAssets.hello,scale: 7.5,)
                     );
                     }):const SizedBox(),

                               ],
                             ),
                           ),
                         ):

                         SizedBox(
                           height: 250,
                           width: 250,
                           child: SvgPicture.asset(controller.data[index]['image'],),
                         ),
                         const SizedBox(height: 40,),
                         navigateContainer(),
                         const SizedBox(height: 30,),
                         Text(
                           controller.data[index]['text'],
                           style:semiBoldFontStyle(
                             color: AppColors.white,
                             size: 22,
                           ),
                         ),
                         const SizedBox(
                           height: 20,
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 40, right: 40),
                           child: Text(
                             controller.data[index]['text1'],
                             textAlign: TextAlign.center,
                             style: mediumFontStyle(
                               size: 12,
                               color: AppColors.lightGreyTextColor,
                             ),
                           ),
                         ),
                       ],
                     );

                   },
                 ),
               ),
               const Spacer(flex: 1,),
               button(),
               const SizedBox(
                 height: 20,
               )
             ],
           ),
         ),
       ) ;
      },

    );
  }
}
