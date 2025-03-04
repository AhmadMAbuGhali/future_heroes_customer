import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/services/app_provider.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../home/NoConnection.dart';

class SuccessLogin extends StatelessWidget {
  const SuccessLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context,provider,index){
      return  Scaffold(
        backgroundColor: ColorManager.backGround,
        body: OfflineBuilder(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                CustomTextTitle(text: 'helloAgain'.tr),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'areYouReady'.tr,
                  style: TextStyle(color: ColorManager.gray),
                ),
                CustomButtonPrimary(
                  text: 'goToHome'.tr,
                  onpressed: ()  async{
                    await provider.getComplaintReplay();
                    await provider.getProfileData();
                    await provider.getUserNotification();
                    await provider.getClassTime();
                    await provider.getOrderReplay();
                    await provider.getOffers();

                   await  Get.offNamed(RouteHelper.initial);
                  },
                )
              ],
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
    });

  }
}
