import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/LogoAuth.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
          child: ListView(children: [
            SvgPicture.asset(ImageAssets.forget_password),
            SizedBox(
              height: 10.h,
            ),
            CustomTextTitle(
              text: 'هل فقدت كلمة المرور؟',
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'البريد الالكتروني / رقم الهاتف',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextFormAuth(
              hidepassword: false,
              textInputType: TextInputType.emailAddress,
              hintText: 'البريد الالكتروني / رقم الهاتف',
            ),
            CustomButtonPrimary(
              text: 'اعادة تعيين كلمة المرور',
              onpressed: () {
                Get.toNamed(RouteHelper.initial);
              },
            ),
          ]),
        ));
  }
}
