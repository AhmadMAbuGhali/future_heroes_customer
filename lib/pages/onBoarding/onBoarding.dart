// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/pages/onBoarding/Onbording/customButtonWidget.dart';
import 'package:future_heroes_customer/pages/onBoarding/Onbording/customdotController.dart';
import 'package:future_heroes_customer/pages/onBoarding/Onbording/cutomslider.dart';
import 'package:future_heroes_customer/pages/onBoarding/Onbording/onboarding_controller.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../../services/shared_preference_helper.dart';
import '../home/NoConnection.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    getIt<SharedPreferenceHelper>().setFirstTime(firstTime: true);
    return Scaffold(
        body: OfflineBuilder(
          child: Container(
      padding: const EdgeInsets.all(16),
      child: Padding(
          padding:  EdgeInsets.only(top: 40.h),
          child: Column(
            children: [
              const Expanded(flex: 4, child: CustomSliderOnBoarding()),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      const CustomDotControllerOnBoarding(),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomButtonOnBoarding(
                        textColor: ColorManager.white,
                        buttonColor: ColorManager.primary,
                        text: 'next'.tr,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomButtonPrimary(
                        onpressed: () {
                          getIt<SharedPreferenceHelper>().setFirstTime(firstTime: false);
                          Get.offAllNamed(RouteHelper.login);
                        },
                        textColor: ColorManager.primary,
                        buttonColor: ColorManager.white,
                        text: 'skip'.tr,
                      )
                    ],
                  ))
            ],
          ),
      ),
    ),
          connectivityBuilder:
              (BuildContext context, List<ConnectivityResult> connectivity, Widget child) {
            final bool connected = connectivity.contains(ConnectivityResult.mobile) ||
                connectivity.contains(ConnectivityResult.wifi);
            return connected ? child : NoConnectionScreen();
          },
        ));
  }
}
