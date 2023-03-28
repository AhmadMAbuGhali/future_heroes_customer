import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/CardCheckBoxWidget.dart';
import 'package:future_heroes_customer/widgets/snakbar.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../../routes/route_helper.dart';
import '../../../services/auth_provider.dart';
import '../../../services/shared_preference_helper.dart';
import '../../../widgets/cardSubscriptionType.dart';

class SubscriptionType extends StatelessWidget {
  SubscriptionType({super.key});
  int? id;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorManager.primary;
      }
      return ColorManager.primary;
    }

    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.backGround,
          body: Container(
              padding: EdgeInsets.all(16),
              child: Column(children: [
                SizedBox(
                  height: 24.h,
                ),
                CustomTextTitle(
                  text: 'lastStep'.tr,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'chosePackage'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorManager.gray),
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  height: 440.h,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: provider.offerSub.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  id = provider.offerSub[index].id;
                                  print(provider.offerSub[index].id);
                                  print(id);
                                  provider.isSelectedChange(index);
                                },
                                child: CardSubscriptionType(
                                  isSelecte: provider.offerSelected[index],
                                  title:
                                      provider.offerSub[index].name ?? "null",
                                  description:
                                      provider.offerSub[index].description ??
                                          "null",
                                  price:
                                      '${provider.offerSub[index].price.toStringAsFixed(2) ?? "null"} ' +
                                          'RS'.tr,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 70.h,
                ),
                CustomButtonPrimary(
                  text: 'continue'.tr,
                  onpressed: () {
                    provider.sendOfferId(id!);
                    getIt<SharedPreferenceHelper>()
                        .setWaitingStat(waitingStat: true);
                    print(id);
                    Get.toNamed(RouteHelper.initial);
                    // Get.toNamed(RouteHelper.endSignUp);
                  },
                )
              ])),
        ),
      );
    });
  }
}
