import 'package:flutter/material.dart';
import 'package:future_heroes_customer/pages/onBoarding/Onbording/onboarding_controller.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  String text;
  Color textColor;
  Color buttonColor;
  CustomButtonOnBoarding(
      {super.key,
      required this.text,
      required this.textColor,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return CustomButtonPrimary(
      text: text,
      textColor: textColor,
      buttonColor: buttonColor,
      onpressed: () {
        controller.next();
      },
    );
  }
}
