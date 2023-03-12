import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:get/get.dart';

class GuestWidget extends StatelessWidget {
  const GuestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ImageAssets.goToLogin,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'ourhonorableguest'.tr,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text('YouMustlogin2'.tr),
        SizedBox(
          height: 10.h,
        ),
        CustomButtonPrimary(
            text: 'login'.tr,
            onpressed: () {
              Get.offAndToNamed(RouteHelper.login);
            })
      ],
    );
  }
}
