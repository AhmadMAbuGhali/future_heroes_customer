import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class snakbarWidget {
  BuildContext context;
  String Titel;
  String Description;
  snakbarWidget(this.context, {required this.Titel, required this.Description});

  void error() {
    MotionToast(
      icon: Icons.error,
      primaryColor: ColorManager.red,
     // backgroundType: BackgroundType.lighter,
      title: Text(
        Titel,
        style: TextStyle(
          color: ColorManager.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(
        Description,
        style: TextStyle(
          color: ColorManager.white,
        ),
      ),
      position: MotionToastPosition.top,
      width: 350.w,
      height: 80.h,
      animationDuration: const Duration(milliseconds: 1000),
     // layoutOrientation: ToastOrientation.ltr,
    ).show(context);
  }

  // ignore: non_constant_identifier_names
  void Success() {
    MotionToast(
      icon: Icons.done,
      primaryColor: ColorManager.green,
      //backgroundType: BackgroundType.transparent,
      title: Text(
        Titel,
        style: TextStyle(
          color: ColorManager.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(
        Description,
        style: TextStyle(
          color: ColorManager.white,
        ),
      ),
      position: MotionToastPosition.top,
      animationType: AnimationType.fromTop,
      width: 350.w,
      height: 70.h,
      //layoutOrientation: ToastOrientation.ltr,
      animationDuration: const Duration(milliseconds: 1000),
    ).show(context);
  }
}
