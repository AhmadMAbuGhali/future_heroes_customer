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
      return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: ListView(children: [
              CustomTextTitle(
                text: 'weAreClose'.tr,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "tellUsDiseases".tr,
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorManager.gray),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
                          ),
                        )),
                  ),
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
                          ),
                        )),
                  ),
                ],
              ),
              !provider.isDiseases
                  ? Column(
                      children: [
                        CustomTextTitle(text: 'choseDisease'.tr),
                        SizedBox(
                          height: 10.h,
                        ),
                        CardCheckBoxWidget(
                          isChecked: provider.isChecked,
                          title: 'diabetes'.tr,
                        ),
                        CardCheckBoxWidget(
                          isChecked: provider.isChecked,
                          title: 'pressure'.tr,
                        ),
                        CardCheckBoxWidget(
                          isChecked: provider.isChecked,
                          title: 'anemia'.tr,
                        ),
                        CardCheckBoxWidget(
                          isChecked: provider.isChecked,
                          title: 'muscleTear'.tr,
                        ),
                        CardCheckBoxWidget(
                          isChecked: provider.isChecked,
                          title: 'heartDisease'.tr,
                        ),
                        CardCheckBoxWidget(
                          isChecked: provider.isChecked,
                          title: 'other'.tr,
                        ),
                      ],
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
      );
    });
  }
}
