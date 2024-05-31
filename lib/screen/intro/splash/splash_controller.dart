import 'package:festiveapp_studio/screen/add_details/add_details_screen.dart';
import 'package:festiveapp_studio/screen/auth/login/login_screen.dart';
import 'package:festiveapp_studio/screen/bottom_navigation/bottom_navigation_screen.dart';
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
    Future.delayed(const Duration(seconds: 3), () {
      PrefService.getBool(PrefKeys.isLogin)
          ? Get.offAll(() => DashboardScreen())
          : PrefService.getBool(PrefKeys.isIntroDone)
              ? Get.offAll(() => LoginScreen())
              : Get.offAll(() => const OnboardingScreen());

      // Future.delayed(const Duration(seconds: 4), () {
      //   Get.to(() =>  BtnScreen());

      // Get.to(() => const OnboardingScreen());
    });
  }
}
