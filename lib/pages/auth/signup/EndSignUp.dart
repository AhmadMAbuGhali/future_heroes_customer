import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';

import '../../home/NoConnection.dart';

class EndSignUp extends StatelessWidget {
  const EndSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: OfflineBuilder(
        child: Padding(
 padding:const EdgeInsets.all(16),
          child: Padding(
            padding:  EdgeInsets.only(top: 40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: SizedBox(
                  width: 200.w,
                  height: 200.h,
                  child: SvgPicture.asset(
                    ImageAssets.welcome,
                  ),
                )),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextTitle(text: 'welcome'.tr),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                 "orderUnderReview".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorManager.gray),
                ),
                CustomButtonPrimary(
                  text: 'moveToLogin'.tr,
                  onpressed: () {
                    Get.offNamed(RouteHelper.login);
                  },
                )
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
      ),
    );
  }
}
