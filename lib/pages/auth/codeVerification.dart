import 'dart:async';

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

class CodeVerification extends StatefulWidget {
  const CodeVerification({super.key});

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  int _start = 60;
  Timer? _timer;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
              if (_start < 1) {
                timer.cancel();
              } else {
                _start = _start - 1;
              }
            }));
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
          child: ListView(children: [
            SvgPicture.asset(ImageAssets.verification),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'الكود قد تم إرساله إلى الإيميل',
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorManager.gray, fontSize: 16),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'Yousef.n.aljazzar@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorManager.primary),
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomTextFormAuth(
              hidepassword: false,
              textInputType: TextInputType.emailAddress,
              hintText: 'ادخل رمز التحقق',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('    يمكنك طلب إعادة ارسال الرمز خلال  '),
                Text(
                  "$_start",
                  style: TextStyle(color: ColorManager.primary),
                ),
                Text("   ثانية  "),
              ],
            ),
            CustomButtonPrimary(
              text: 'تحقق',
              onpressed: () {
                startTimer();
              },
            ),
          ]),
        ));
  }
}
