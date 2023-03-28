import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/profile_section.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../resources/assets_manager.dart';
import '../../resources/styles_manager.dart';
import '../../widgets/CustomButtonPrimary.dart';

class GuestProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  height: 80.h,
                  width: 80.w,
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      CircleAvatar(
                        foregroundImage: Image.asset(
                          ImageAssets.avatar,
                        ).image,
                        backgroundImage: Image.asset(
                          ImageAssets.avatar,
                        ).image,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "ourhonorableguest".tr,
                  style: getBoldStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Guest@gmail.com",
                  style: getRegularStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 5.h,
                ),

                SizedBox(
                  height: 40.h,
                ),
                //معلومات الشخصية
                ProfileSection(
                    label: "personalDetails".tr,
                    myColor: ColorManager.gray,
                    haveArrow: false,
                    icon: IconAssets.user,
                    onTap: () {
                      //   Get.toNamed(RouteHelper.personalData);
                    }),

                //الطلبات والشكاوي
                ProfileSection(
                    label: "requestsAndComplaints".tr,
                    myColor: ColorManager.gray,
                    haveArrow: false,
                    icon: IconAssets.paper,
                    onTap: () {
                      //  Get.toNamed(RouteHelper.requestsAndComplaints);
                    }),

                //مواعيد التدريب

                ProfileSection(
                    label: "classTime".tr,
                    myColor: ColorManager.gray,
                    haveArrow: false,
                    icon: IconAssets.calendar,
                    onTap: () {
                      //     Get.toNamed(RouteHelper.classTime);
                    }),

                //التقيمات

                ProfileSection(
                    label: "rating".tr,
                    myColor: ColorManager.gray,
                    haveArrow: false,
                    icon: IconAssets.stars,
                    onTap: () {
                      //  Get.toNamed(RouteHelper.ratings);
                    }),
                //العروض
                ProfileSection(
                    label: "offer".tr,
                    haveArrow: true,
                    icon: IconAssets.localoffer,
                    onTap: () {
                      Get.toNamed(RouteHelper.guestOffers);
                    }),

                //اللغة
                ProfileSection(
                    label: "language".tr,
                    haveArrow: true,
                    icon: IconAssets.language,
                    onTap: () {
                      Get.toNamed(RouteHelper.language);
                    }),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'ourhonorableguest'.tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text('YouMustlogin2'.tr),
                SizedBox(
                  height: 10.h,
                ),
                CustomButtonPrimary(
                    text: 'login'.tr,
                    onpressed: () {
                      Get.offAndToNamed(RouteHelper.login);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
