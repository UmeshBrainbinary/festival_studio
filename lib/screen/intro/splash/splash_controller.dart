import 'package:festiveapp_studio/screen/auth/login/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => const LoginScreen());
      // Get.to(() => const OnboardingScreen());
    });
  }
}
