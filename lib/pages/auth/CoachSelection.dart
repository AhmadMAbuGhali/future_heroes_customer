import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/pages/auth/CardWidget.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/CardCheckBoxWidget.dart';
import 'package:future_heroes_customer/widgets/snakbar.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';
import '../../services/auth_provider.dart';



class CoachSelection extends StatelessWidget {
   CoachSelection({super.key});




  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, provider, x){
      return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: ListView(children: [
            CustomTextTitle(
              text: 'choseCoach'.tr,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "choseFavCoach".tr,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorManager.gray),
            ),
            Text('sportSection'.tr),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: provider.isCoachSelection
                          ? null
                          : Border.all(
                              color: ColorManager.primary,
                              width: 2,
                            )),
                  child: InkWell(
                      onTap: () {
                        provider.makeCoachSelectionFalse();
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/avatar.png',
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            'coach1'.tr,
                            style: getRegularStyle(color: ColorManager.primary),
                          ),

                        ],
                      )),
                ),
                InkWell(
                  focusColor: ColorManager.primary,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    provider.makeCoachSelectionTrue();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          border: provider.isCoachSelection
                              ? Border.all(
                                  color: ColorManager.primary,
                                  width: 2,
                                )
                              : null),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/avatar.png',
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            'coach2'.tr,
                           style: getRegularStyle(color: ColorManager.primary),
                          ),

                        ],
                      )),
                ),
              ],
            ),
            provider.isCoachSelection
                ? Column(
                    children: [
                      Text(
                        'coachClassDay'.tr,
                        style: TextStyle(color: ColorManager.black),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CardWidget(
                        title: 'ClassDays'.tr,
                      ),
                      Text(
                        'availableTime'.tr,
                        style: TextStyle(color: ColorManager.black),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 15.w),
                        margin: EdgeInsets.symmetric(vertical: 5.h),
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorManager.gray),
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<String>(
                          value: provider.dropdownValue,
                          elevation: 16,
                          style: const TextStyle(color: ColorManager.primary),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? value) {
                           provider.showDropdownValue(value);
                          },
                          items: provider.timeList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [],
                  ),
            CustomButtonPrimary(
              text: 'continue'.tr,
              onpressed: () {
                Get.toNamed(RouteHelper.diseases);
              },
            )
          ])),
    );});
  }
}
