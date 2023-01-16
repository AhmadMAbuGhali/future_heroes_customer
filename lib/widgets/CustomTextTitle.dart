import 'package:flutter/material.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';

class CustomTextTitle extends StatelessWidget {
  final String text;

  const CustomTextTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(color: ColorManager.black, fontSize: 20));
  }
}
