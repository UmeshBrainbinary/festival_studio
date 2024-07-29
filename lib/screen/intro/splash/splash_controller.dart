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
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 5), () {
      PrefService.getBool(PrefKeys.isLogin)
          ? Get.offAll(() =>   PrefService.getBool(PrefKeys.isBrand)? DashBoardScreen():AddDetailsScreen())
          : PrefService.getBool(PrefKeys.isIntroDone)
              ? Get.offAll(() =>  SignUpScreen())
              : Get.offAll(() => const OnboardingScreen());

      // Future.delayed(const Duration(seconds: 4), () {
      //   Get.to(() =>  BtnScreen());

      // Get.to(() => const OnboardingScreen());
    });
  }
}
