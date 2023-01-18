import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/pages/auth/cardSubscriptionType.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/CardCheckBoxWidget.dart';
import 'package:future_heroes_customer/widgets/snakbar.dart';
import 'package:get/route_manager.dart';

import '../../routes/route_helper.dart';

class SubscriptionType extends StatefulWidget {
  const SubscriptionType({super.key});

  @override
  State<SubscriptionType> createState() => _SubscriptionTypeState();
}

class _SubscriptionTypeState extends State<SubscriptionType> {
  bool isSubscriptionType = false;
  bool isChecked = false;
  bool isSelecteOne = false;
  bool isSelectetwo = false;
  bool isSelecteThree = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorManager.primary;
      }
      return ColorManager.primary;
    }

    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(children: [
            SizedBox(
              height: 60.h,
            ),
            CustomTextTitle(
              text: ' بقيت خطوة اخيرة',
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'اختر الباقة  المناسبة لك',
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorManager.gray),
            ),
            SizedBox(
              height: 60.h,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isSelecteOne = true;
                  isSelectetwo = false;
                  isSelecteThree = false;
                });
              },
              child: CardSubscriptionType(
                isSelecte: isSelecteOne,
                title: 'شهر واحد',
                description: 'يتم سرد تفاصيل الاشتراك هنا',
                price: '99.99 ريال',
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isSelecteOne = false;
                  isSelectetwo = true;
                  isSelecteThree = false;
                });
              },
              child: CardSubscriptionType(
                isSelecte: isSelectetwo,
                title: 'شهرين',
                description: 'يتم سرد تفاصيل الاشتراك هنا',
                price: '179.99 ريال',
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isSelecteOne = false;
                  isSelectetwo = false;
                  isSelecteThree = true;
                });
              },
              child: CardSubscriptionType(
                isSelecte: isSelecteThree,
                title: 'ثلاث شهور',
                description: 'يتم سرد تفاصيل الاشتراك هنا',
                price: '249.99 ريال',
              ),
            ),
            Spacer(),
            CustomButtonPrimary(
              text: 'متابعة',
              onpressed: () {
                Get.toNamed(RouteHelper.endSignUp);
              },
            )
          ])),
    );
  }
}
