import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/profile_section.dart';
import 'package:get/get.dart';

import '../../resources/assets_manager.dart';
import '../../resources/styles_manager.dart';
import '../../widgets/CustomButtonPrimary.dart';
import '../home/NoConnection.dart';

class GuestProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OfflineBuilder(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding:  EdgeInsets.only(top: 40.h),
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
                  SizedBox(height: 10.h),

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
                  SizedBox(height: 10.h),

                  ProfileSection(
                      label: "classTime".tr,
                      myColor: ColorManager.gray,
                      haveArrow: false,
                      icon: IconAssets.calendar,
                      onTap: () {
                        //     Get.toNamed(RouteHelper.classTime);
                      }),

                  //التقيمات
                  SizedBox(height: 10.h),
                  ProfileSection(
                      label: "rating".tr,
                      myColor: ColorManager.gray,
                      haveArrow: false,
                      icon: IconAssets.stars,
                      onTap: () {
                        //  Get.toNamed(RouteHelper.ratings);
                      }),
                  //العروض
                  SizedBox(height: 10.h),

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
                    style: const TextStyle(fontWeight: FontWeight.bold),
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
        connectivityBuilder:
            (BuildContext context, ConnectivityResult connectivity, Widget child) {

          final bool connected = connectivity != ConnectivityResult.none;
          return connected?child:NoConnectionScreen();


        },
      ),
    );
  }
}
