import 'package:flutter/material.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';

class CustomButtonPrimary extends StatelessWidget {
  final String text;
  final void Function() onpressed;

  const CustomButtonPrimary(
      {super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          foregroundColor: ColorManager.white,
          padding: const EdgeInsets.symmetric(vertical: 10),
          primary: ColorManager.primary,
          textStyle: TextStyle(
            fontFamily: 'DroidKufi',
            fontSize: 16,
          ),
        ),
        onPressed: onpressed,
        child: Text(text),
      ),
    );
  }
}
