
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CommonBackButton extends StatelessWidget {
  final VoidCallback onTap;
  const CommonBackButton({
    super.key,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(AppAssets.backbutton,height: 30,width: 30,),
    );
  }
}