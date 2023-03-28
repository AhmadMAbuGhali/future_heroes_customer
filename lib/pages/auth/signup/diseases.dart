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

import '../../../routes/route_helper.dart';
import '../../../services/auth_provider.dart';

class Diseases extends StatelessWidget {
  Diseases({super.key});

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
              child: ListView(children: [
                SizedBox(
                  height: 16.h,
                ),
                Center(
                  child: CustomTextTitle(
                    text: 'weAreClose'.tr,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "tellUsDiseases".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorManager.gray, fontSize: 12),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      focusColor: ColorManager.primary,
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        provider.makeIsDiseasesTrue();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          margin: EdgeInsets.symmetric(vertical: 5.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: provider.isDiseases
                                  ? ColorManager.primary
                                  : ColorManager.white,
                              border: provider.isDiseases
                                  ? Border.all(
                                      color: ColorManager.primary,
                                      width: 2,
                                    )
                                  : null),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'iDontHaveDisease'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: provider.isDiseases
                                    ? ColorManager.white
                                    : ColorManager.black,
                              ),
                            ),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: provider.isDiseases
                              ? ColorManager.white
                              : ColorManager.primary,
                          border: provider.isDiseases
                              ? null
                              : Border.all(
                                  color: ColorManager.primary,
                                  width: 2,
                                )),
                      child: InkWell(
                          onTap: () {
                            provider.makeIsDiseasesFalse();
                          },
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Text(
                              'iHaveDiseases'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: provider.isDiseases
                                    ? ColorManager.black
                                    : ColorManager.white,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                !provider.isDiseases
                    ? SizedBox(
                        height: 400.h,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: provider.diseases.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Column(
                                  children: [
                                    CardCheckBoxWidget(
                                      isChecked: provider.isChecked,
                                      title: provider.diseases[index].name ??
                                          ' null',
                                    ),
                                  ],
                                ),
                              );
                              return Text(provider.categoryMain[index].name ??
                                  ' nullß');
                            }),
                      )
                    : Column(
                        children: [],
                      ),
                CustomButtonPrimary(
                  text: 'continue'.tr,
                  onpressed: () {
                    Get.toNamed(RouteHelper.subscriptionType);
                  },
                )
              ])),
        ),
      );
    });
  }
}
