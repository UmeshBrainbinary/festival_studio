
import 'package:festiveapp_studio/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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