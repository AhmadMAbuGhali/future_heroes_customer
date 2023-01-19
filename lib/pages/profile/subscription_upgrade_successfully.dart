import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';

import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';
import '../../widgets/CustomButtonPrimary.dart';

class SubscriptionUpgradeSuccessfully extends StatelessWidget {
  const SubscriptionUpgradeSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 45.h,
                left: 20.w,
                right: 20.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                            Icons.arrow_back,
                            color: ColorManager.primary,
                          )),
                    ],
                  )
                ],
              ),
            ),
            CustomTextTitle(text: "ترقية الاشتراك"),
            SizedBox(height: 70.h,),
            SvgPicture.asset(ImageAssets.upgrage,width: 250.w,height: 250.h,),
            SizedBox(height: 40.h,),
            CustomTextTitle(text: "يرجى التوجه الى مقر النادي لتأكيد  عملية الترقية ودفع المبلغ"),
            SizedBox(height: 80.h,),
            CustomButtonPrimary(text: "موافق ", onpressed: (){
              Get.toNamed(RouteHelper.initial);
            }),

          ],
        ),
      ),
    );
  }
}
