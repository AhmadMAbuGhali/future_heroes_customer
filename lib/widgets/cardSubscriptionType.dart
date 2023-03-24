import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/resources/styles_manager.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';

class CardSubscriptionType extends StatelessWidget {
  String title;
  String description;
  String price;
  bool isSelecte;
  CardSubscriptionType({super.key, required this.isSelecte, required this.title, required this.description, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 80.h,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: !isSelecte
          ? BoxDecoration(
              border: Border.all(color: ColorManager.gray, width: 1),
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(10))
          : BoxDecoration(
              border: Border.all(color: ColorManager.primary, width: 2),
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomTextTitle(text: title),
              Text(price, style: TextStyle(color: ColorManager.primary, fontWeight: FontWeight.bold))
            ],
          ),
          Text(description, textAlign: TextAlign.left, style: getRegularStyle(color: ColorManager.gray))
        ],
      ),
    );
  }
}
