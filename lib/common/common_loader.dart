import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CommonLoader extends StatelessWidget {
  const CommonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(0),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(35),
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow:  [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
            color: Colors.white,
          ),
          child: const CircularProgressIndicator(
            backgroundColor : AppColors.blackColor,
            color: AppColors.lightPink,
          ),
        ),
      ),
    );
  }
}