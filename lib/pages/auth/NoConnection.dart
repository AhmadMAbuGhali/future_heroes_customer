import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: SizedBox(
              width: 200.w,
              height: 200.h,
              child: SvgPicture.asset(
                ImageAssets.welcome,
              ),
            )),
            SizedBox(
              height: 20.h,
            ),
            CustomTextTitle(text: 'هناك مشكلة'),
            SizedBox(
              height: 20.h,
            ),
            Text(
              '''للأسف قد تعذر الإتصال بالأنترنت.
يرجى التحقق من فضلك.''',
              style: TextStyle(color: ColorManager.gray),
            ),
            CustomButtonPrimary(
              text: 'أعد المحاولة',
              onpressed: () {
                Get.offNamed(RouteHelper.login);
              },
            )
          ],
        ),
      ),
    );
  }
}
