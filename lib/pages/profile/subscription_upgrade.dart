import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/sub_upgrad.dart';
import 'package:get/get.dart';

import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class SubscriptionUpgrade extends StatelessWidget {
  const SubscriptionUpgrade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 45.h,
                left: 20.w,
                right: 20.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "المستخدم",
                        style: getBoldStyle(color: ColorManager.primary),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            color: ColorManager.primary,
                          )),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 40.h,),
            CustomTextTitle(text: "ترقية الاشتراك"),
            SubUpgrade(),
            CustomButtonPrimary(text: "تأكيد الترقية", onpressed: (){
              Get.toNamed(RouteHelper.subscriptionUpgradeSuccessfully);
            })
          ],
        ),
      ),
    );
  }
}
