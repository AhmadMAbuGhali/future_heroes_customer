import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../services/auth_provider.dart';
import '../../widgets/cardSubscriptionType.dart';
import '../home/NoConnection.dart';

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
        body: OfflineBuilder(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding:  EdgeInsets.only(top: 40.h),
              child: Column(children: [
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
                          'user'.tr,
                          style: getBoldStyle(color: ColorManager.primary),
                        ),
                      ],
                    )
                  ],
                ),

                CustomTextTitle(
                  text: 'subscriptionUpgrade'.tr,
                ),
                SizedBox(
                  height: 10.h,
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
                      itemCount: provider.listPackages.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  id = provider.listPackages[index].id;

                                  provider.isSelectedChange(index);
                                },
                                child: CardSubscriptionType(
                                  isSelecte: provider.offerSelected[index],
                                  title: provider.listPackages[index].name ?? "null",
                                  description: provider.listPackages[index].description ?? "null",
                                  price: '${provider.listPackages[index].price.toStringAsFixed(2) ?? "null"} ${'RS'.tr}',
                                ),
                              ),
                            ],
                          ),
                        );
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
