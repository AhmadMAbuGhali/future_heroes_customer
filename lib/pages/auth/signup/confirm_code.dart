import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
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
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../services/auth_provider.dart';

class ConfirmCode extends StatefulWidget {
  const ConfirmCode({super.key});

  @override
  State<ConfirmCode> createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return SafeArea(
        child: Scaffold(
            backgroundColor: ColorManager.backGround,
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
              child: ListView(children: [
                SvgPicture.asset(ImageAssets.verification),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  Trans('codeWasSend').tr,
                  textAlign: TextAlign.center,
                  style: getRegularStyle(
                      color: ColorManager.gray, fontSize: 16.sp),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: Text(
                    provider.emailSignUpPage.text.trim(),
                    style: getMediumStyle(
                        color: ColorManager.black, fontSize: FontSize.s14.sp),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: PinFieldAutoFill(
                    decoration: UnderlineDecoration(
                      textStyle:
                          TextStyle(fontSize: 20, color: ColorManager.primary),
                      colorBuilder:
                          FixedColorBuilder(Colors.black.withOpacity(0.3)),
                    ),
                    codeLength: 4,
                    controller: provider.sendCodeConfController,
                    currentCode: provider.sendCodeConfController.text,
                    onCodeSubmitted: (code) {
                      if (code.length == 4) {
                        // showCustomDialog(context);
                      }
                    },
                    onCodeChanged: (code) {
                      if (code!.length == 4) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  width: double.infinity,
                  height: 44.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorManager.primary, // Background color
                      ),
                      onPressed: provider.isLoading
                          ? null
                          : () async {
                              if (provider.sendCodeConfController.text
                                      .trim()
                                      .length ==
                                  4) {
                                provider.changeIsLoding(true);
                                String? success =
                                    await provider.sendEmailConfirmation(
                                        provider.emailSignUpPage.text,
                                        provider.sendCodeConfController.text);
                                if (success == 'true') {
                                  provider.changeIsLoding(false);
                                  Get.toNamed(RouteHelper.login);
                                } else {
                                  provider.changeIsLoding(false);
                                  final snackBar = SnackBar(
                                    content: const Text('الرمز غير صحيح'),
                                    duration: const Duration(seconds: 2),
                                    backgroundColor: ColorManager.red,
                                  );
                                  rootScaffoldMessengerKey.currentState
                                      ?.showSnackBar(snackBar);
                                }
                              } else {
                                final snackBar = SnackBar(
                                  content: Text(Trans('enterCode').tr),
                                  backgroundColor: ColorManager.red,
                                  duration: const Duration(seconds: 1),
                                );
                                rootScaffoldMessengerKey.currentState
                                    ?.showSnackBar(snackBar);
                              }
                            },
                      child: provider.isLoading
                          ? Row(
                              children: [
                                Text(Trans('verification').tr,
                                    style: getMediumStyle(
                                        color: ColorManager.white,
                                        fontSize: FontSize.s18.sp)),
                                SizedBox(
                                  width: 10.w,
                                ),
                                CircularProgressIndicator(
                                    color: ColorManager.white)
                              ],
                            )
                          : Text(Trans('verification').tr,
                              style: getMediumStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.s18.sp))),
                ),
              ]),
            )),
      );
    });
  }
}
