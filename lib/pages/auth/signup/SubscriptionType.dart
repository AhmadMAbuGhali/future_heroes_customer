import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/pages/auth/widget/cardSubscriptionType.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/CardCheckBoxWidget.dart';
import 'package:future_heroes_customer/widgets/snakbar.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../../routes/route_helper.dart';
import '../../../services/auth_provider.dart';

class SubscriptionType extends StatelessWidget {
  SubscriptionType({super.key});

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
      return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(children: [
              SizedBox(
                height: 60.h,
              ),
              CustomTextTitle(
                text: 'lastStep'.tr,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'chosePackage'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorManager.gray),
              ),
              SizedBox(
                height: 60.h,
              ),
              InkWell(
                onTap: () {
                  provider.selectOne();
                },
                child: CardSubscriptionType(
                  isSelecte: provider.isSelectedOne,
                  title: 'month'.tr,
                  description: 'packageDetails'.tr,
                  price: '${provider.price1} ' + 'RS'.tr,
                ),
              ),
              InkWell(
                onTap: () {
                  provider.selectTow();
                },
                child: CardSubscriptionType(
                  isSelecte: provider.isSelectedTwo,
                  title: 'month2'.tr,
                  description: 'packageDetails'.tr,
                  price: '${provider.price2} ' + 'RS'.tr,
                ),
              ),
              InkWell(
                onTap: () {
                  provider.selectThree();
                },
                child: CardSubscriptionType(
                  isSelecte: provider.isSelectedThree,
                  title: 'month3'.tr,
                  description: 'packageDetails'.tr,
                  price: '${provider.price3}  ' + 'RS'.tr,
                ),
              ),
              Spacer(),
              CustomButtonPrimary(
                text: 'continue'.tr,
                onpressed: () {
                  Get.toNamed(RouteHelper.endSignUp);
                },
              )
            ])),
      );
    });
  }
}
