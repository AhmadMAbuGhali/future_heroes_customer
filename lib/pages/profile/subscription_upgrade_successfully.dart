import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/services/app_provider.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';
import '../../widgets/CustomButtonPrimary.dart';
import '../home/NoConnection.dart';

class SubscriptionUpgradeSuccessfully extends StatelessWidget {
  const SubscriptionUpgradeSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (contxet,provider,index){
      return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: OfflineBuilder(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: ColorManager.primary,
                              )),
                          Text(
                            "user".tr,
                            style: getBoldStyle(color: ColorManager.primary),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextTitle(text: 'subscriptionUpgrade'.tr),
                  SizedBox(
                    height: 70.h,
                  ),
                  SvgPicture.asset(
                    ImageAssets.upgrage,
                    width: 250.w,
                    height: 250.h,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'goToGemToApprove'.tr,
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: 14.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  CustomButtonPrimary(
                      text: "ok".tr,
                      onpressed: () async {
                        await provider.getComplaintReplay();
                        await provider.getProfileData();
                        await provider.getUserNotification();
                        await provider.getClassTime();
                        await provider.getOrderReplay();
                        await provider.getOffers();
                        Get.toNamed(RouteHelper.initial);
                      }),
                ],
              ),
            ),
          ),
          connectivityBuilder:
              (BuildContext context, ConnectivityResult connectivity,
              Widget child) {
            final bool connected = connectivity != ConnectivityResult.none;
            return connected ? child : NoConnectionScreen();
          },
        ),
      );
    });
  }
}
