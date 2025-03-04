import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/resources/styles_manager.dart';

class CustomButtonPrimary extends StatelessWidget {
  final String text;
  final void Function()? onpressed;
  Color? textColor;
  Color? buttonColor;

  CustomButtonPrimary(
      {super.key,
      required this.text,
      required this.onpressed,
      this.textColor = Colors.white,
      this.buttonColor = ColorManager.primary});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44.h,
      // margin:  EdgeInsets.only(top: 10.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)), backgroundColor: buttonColor,
          foregroundColor: ColorManager.white,
          side: const BorderSide(color: ColorManager.primary),
          padding: EdgeInsets.symmetric(vertical: 10.h),
          textStyle: TextStyle(
            fontFamily: 'DroidKufi',
            fontSize: 16.sp,
          ),
        ),
        onPressed: onpressed,
        child: onpressed == null
            ? Center(
                child: Row(
                  children: [
                    Text(
                      text,
                      style: getRegularStyle(color: textColor!),
                    ),
                    const CircularProgressIndicator()
                  ],
                ),
              )
            : Text(
                text,
                style: getRegularStyle(color: textColor!),
              ),
      ),
    );
  }
}
