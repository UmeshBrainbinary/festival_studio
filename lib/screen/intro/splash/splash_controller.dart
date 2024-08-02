import 'package:festiveapp_studio/common/status_bar.dart';
import 'package:festiveapp_studio/screen/add_details/add_details_screen.dart';
import 'package:festiveapp_studio/screen/auth/login/login_screen.dart';
import 'package:festiveapp_studio/screen/auth/signup/signup_screen.dart';
import 'package:festiveapp_studio/screen/dashboard/dashboard_screen.dart';
import 'package:festiveapp_studio/screen/intro/onboarding/onboarding_screen.dart';
import 'package:festiveapp_studio/service/pref_services.dart';
import 'package:festiveapp_studio/utils/pref_keys.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    lightStatusBar();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 5), () {

      if(PrefService.getBool(PrefKeys.isLogin))
        {
          if(PrefService.getBool(PrefKeys.isBrand))
            {
              lightStatusBar();
              Get.offAll(() =>   DashBoardScreen())?.whenComplete(()=> lightStatusBar());
            }
          else
            {
              darkStatusBar();
              Get.offAll(() =>  AddDetailsScreen())?.whenComplete(()=> lightStatusBar());
            }
        }
      else{
        if( PrefService.getBool(PrefKeys.isIntroDone))
          {
            lightStatusBar();
            Get.offAll(() =>  SignUpScreen())?.whenComplete(()=> lightStatusBar());
          }
        else
          {
            lightStatusBar();
            Get.offAll(() => const OnboardingScreen())?.whenComplete(()=> lightStatusBar());
          }
      }


      // Future.delayed(const Duration(seconds: 4), () {
      //   Get.to(() =>  BtnScreen());

      // Get.to(() => const OnboardingScreen());
    });
  }
}
