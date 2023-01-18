import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/auth/cardSubscriptionType.dart';
import '../resources/color_manager.dart';

class SubUpgrade extends StatefulWidget {
  const SubUpgrade({Key? key}) : super(key: key);

  @override
  State<SubUpgrade> createState() => _SubUpgradeState();
}

class _SubUpgradeState extends State<SubUpgrade> {
  bool isSubscriptionType = false;
  bool isChecked = false;

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
    return Column(
      children: [
        Text(
          'اختر الباقة  المناسبة لك',
          textAlign: TextAlign.center,
          style: TextStyle(color: ColorManager.gray),
        ),
        SizedBox(
          height: 60.h,
        ),
        CardSubscriptionType(
          title: 'شهر واحد',
          description: 'يتم سرد تفاصيل الاشتراك هنا',
          price: '99.99 ريال',
        ),
        CardSubscriptionType(
          title: 'شهرين',
          description: 'يتم سرد تفاصيل الاشتراك هنا',
          price: '179.99 ريال',
        ),
        CardSubscriptionType(
          title: 'ثلاث شهور',
          description: 'يتم سرد تفاصيل الاشتراك هنا',
          price: '249.99 ريال',
        ),
      ],
    );
  }
}
