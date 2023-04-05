// ignore_for_file: iterable_contains_unrelated_type

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../resources/styles_manager.dart';
import '../../../routes/route_helper.dart';
import '../../../services/auth_provider.dart';
import '../../home/NoConnection.dart';

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
        body: OfflineBuilder(
          child: Container(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                  child: Column(
                  children: [
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
                            decoration: const BoxDecoration(),
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
                    ? SingleChildScrollView(
                  child: Column(
                      children: List.generate(
                          provider.diseases.length,
                              (index) => Column(
                                children: [
                                  Container(
                            decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: ColorManager.primary,
                                    ),
                                    borderRadius: BorderRadius.circular(15.r)),
                            child: CheckboxListTile(
                                  checkColor: ColorManager.primary,
                                  value: provider.diseasesId.contains(
                                      provider.diseases[index].id),
                                  onChanged: (selected) {
                                    if (provider.diseases.contains(provider
                                        .diseases[index].id) ==
                                        true) {
                                      provider.removediseasesId(index);
                                    } else {
                                      provider.adddiseasesId(index);
                                    }
                                    // provider.onUserSelect(selected??false, index);
                                  },
                                  selected: true,
                                  title: Text(
                                    provider.diseases[index].name ??
                                        '',
                                    style: getRegularStyle(
                                        color: ColorManager.primary),
                                  ),
                            ),

                          ),
                                  SizedBox(height: 10.h,),

                                ],
                              ))),
                )
                    :  const Column(children: [],),
                CustomButtonPrimary(
                  text: 'continue'.tr,
                  onpressed: () {

                    Get.offNamed(RouteHelper.subscriptionType);
                  },
                )
              ])),),
          connectivityBuilder:
              (BuildContext context, ConnectivityResult connectivity, Widget child) {

            final bool connected = connectivity != ConnectivityResult.none;
            return connected?child:NoConnectionScreen();


          },
        ),

      );
    });
  }
}
