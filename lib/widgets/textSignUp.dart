import 'package:flutter/material.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:get/get.dart';

class CustomTextSignUpOrSignin extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function()? onTap;

  const CustomTextSignUpOrSignin(
      {required this.textone, required this.texttwo, this.onTap});

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
            style: TextStyle(
                color: ColorManager.primary, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
