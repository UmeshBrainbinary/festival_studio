import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'testStyle.dart';

class CommonPrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double? width;
  final Color? buttonColor;
  final Color? textColor;
  final bool? isLoading;

  const CommonPrimaryButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.width,
    this.buttonColor,
    this.textColor,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading == true ? () {} : onTap,
      child: Container(
        width: width ?? Get.width,
        height: 48,
        padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: isLoading == true ? 5 : 0)
            .copyWith(bottom: isLoading == true ? 5 : 2),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: buttonColor ?? AppColors.lightPink,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: const [
            BoxShadow(
              color: Color(0x0C101828),
              blurRadius: 2,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: isLoading == true
            ? const SizedBox(
                height: 24,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                  ),
                ))
            : Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: semiBoldFontStyle(
                      size: 17, color: textColor ?? AppColors.white, height: 0),
                ),
              ),
      ),
    );
  }
}

Widget commonButtonCard(
    {double? width,
    Color? buttonColor,
    required String text,
    required String image,
    Color? textColor}) {
  return Container(
    height: 48,
    width: width ?? Get.width,
    decoration: ShapeDecoration(
      color: buttonColor ?? AppColors.lightPink,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      shadows: const [
        BoxShadow(
          color: Color(0x0C101828),
          blurRadius: 2,
          offset: Offset(0, 1),
          spreadRadius: 0,
        )
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          image,
          height: 20,
          width: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: regularFontStyle(
              size: 17, color: textColor ?? AppColors.white, height: 0),
        )
      ],
    ),
  );
}
