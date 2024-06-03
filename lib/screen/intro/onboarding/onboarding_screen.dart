import 'package:festiveapp_studio/common/common_primary_button.dart';
import 'package:festiveapp_studio/screen/intro/onboarding/onboarding_controller.dart';
import 'package:festiveapp_studio/screen/intro/onboarding/onboarding_widget.dart';

import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingController());
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            pageViewOnboard(),
            const Spacer(),
            button(),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
