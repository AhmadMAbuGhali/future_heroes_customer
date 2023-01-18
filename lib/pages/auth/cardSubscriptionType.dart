import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';

class CardSubscriptionType extends StatelessWidget {
  String title;
  String description;
  String price;
  CardSubscriptionType(
      {super.key,
      required this.title,
      required this.description,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.gray),
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextTitle(text: title),
              Text(price,
                  style: TextStyle(
                      color: ColorManager.primary, fontWeight: FontWeight.bold))
            ],
          ),
          Text(description,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: ColorManager.gray, fontWeight: FontWeight.normal))
        ],
      ),
    );
  }
}
