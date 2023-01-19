import 'package:flutter/material.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/resources/styles_manager.dart';
import 'package:get/get.dart';

class CustomTextSignUpOrSignin extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;

  const CustomTextSignUpOrSignin(
      {super.key, required this.textone, required this.texttwo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: getBoldStyle(color: ColorManager.primary) ),
        )
      ],
    );
  }
}
