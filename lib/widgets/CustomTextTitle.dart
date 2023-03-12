import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/resources/font_manager.dart';
import 'package:future_heroes_customer/resources/styles_manager.dart';

class CustomTextTitle extends StatelessWidget {
  final String text;
  FontSize? fontSize ;

  CustomTextTitle({super.key, required this.text,this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Text(text,
          textAlign: TextAlign.start,
          // overflow: TextOverflow.ellipsis,
          style: getRegularStyle(color: Colors.black,fontSize: FontSize.s14,)),
    );
  }
}

