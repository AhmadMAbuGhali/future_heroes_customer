import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/sub_upgrad.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../services/auth_provider.dart';
import '../../services/shared_preference_helper.dart';
import '../../widgets/cardSubscriptionType.dart';

class SubscriptionUpgrade extends StatelessWidget {
   SubscriptionUpgrade({Key? key}) : super(key: key);

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
      return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(
                top: 45.h,
                left: 20.w,
                right: 0.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: ColorManager.primary,
                          )),
                      Text(
                        'user'.tr,
                        style: getBoldStyle(color: ColorManager.primary),
                      ),
                    ],
                  )
                ],
              ),
            ),

            CustomTextTitle(
              text: 'subscriptionUpgrade'.tr,
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
              height: 30.h,
            ),
            SizedBox(
              height: 400.h,
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
                              title: provider.offerSub[index].name ?? "null",
                              description: provider.offerSub[index].description ?? "null",
                              price: '${provider.offerSub[index].price.toStringAsFixed(2) ?? "null"} ' + 'RS'.tr,
                            ),
                          ),
                        ],
                      ),
                    );
                    return Text(provider.categoryMain[index].name ?? ' nullß');
                  }),
            ),
            SizedBox(
              height: 100.h,
            ),
            CustomButtonPrimary(
              text: 'continue'.tr,
              onpressed: () {
                provider.sendOfferId(id!);
                Get.toNamed(RouteHelper.subscriptionUpgradeSuccessfully);
                // Get.toNamed(RouteHelper.endSignUp);
              },
            )
          ]),
        ),
      );
    });
  }
}
