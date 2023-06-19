import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/pages/onBoarding/Onbording/onboarding_controller.dart';
import 'package:future_heroes_customer/pages/onBoarding/static.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        onPageChanged: (value) {
          controller.onPageChanged(value);
        },
        controller: controller.pageController,
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Image.asset(
                  onBoardingList[i].image ?? '',
                  width: 250.w,
                  height: 250.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextTitle(
                  text: onBoardingList[i].title ?? '',
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text(onBoardingList[i].body ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorManager.gray))),
              ],
            ));
  }
}
