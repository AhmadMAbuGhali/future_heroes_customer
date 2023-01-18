import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/CardCheckBoxWidget.dart';
import 'package:future_heroes_customer/widgets/snakbar.dart';
import 'package:get/route_manager.dart';

import '../../routes/route_helper.dart';

class Diseases extends StatefulWidget {
  const Diseases({super.key});

  @override
  State<Diseases> createState() => _DiseasesState();
}

class _DiseasesState extends State<Diseases> {
  bool isDiseases = false;
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

    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: ListView(children: [
            CustomTextTitle(
              text: ' لقد شارفنا على الانتهاء',
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              '''اذا كنت تعاني من بعض الامراض 
اخبرنا بذلك''',
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorManager.gray),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: isDiseases
                          ? null
                          : Border.all(
                              color: ColorManager.primary,
                              width: 2,
                            )),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          isDiseases = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Text(
                          'اعاني من بعض الامراض',
                          textAlign: TextAlign.center,
                        ),
                      )),
                ),
                InkWell(
                  focusColor: ColorManager.primary,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    setState(() {
                      isDiseases = true;
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: isDiseases
                              ? Border.all(
                                  color: ColorManager.primary,
                                  width: 2,
                                )
                              : null),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'كلا , انا سليم وخالي من الامراض',
                          textAlign: TextAlign.center,
                        ),
                      )),
                ),
              ],
            ),
            !isDiseases
                ? Column(
                    children: [
                      CustomTextTitle(text: 'اختر من القائمة نوع المرض'),
                      SizedBox(
                        height: 10.h,
                      ),
                      CardCheckBoxWidget(
                        isChecked: isChecked,
                        title: 'السكر',
                      ),
                      CardCheckBoxWidget(
                        isChecked: isChecked,
                        title: 'ضغط',
                      ),
                      CardCheckBoxWidget(
                        isChecked: isChecked,
                        title: 'فقر الدم',
                      ),
                      CardCheckBoxWidget(
                        isChecked: isChecked,
                        title: 'تمزق عضلي',
                      ),
                      CardCheckBoxWidget(
                        isChecked: isChecked,
                        title: 'امراض القلب',
                      ),
                      CardCheckBoxWidget(
                        isChecked: isChecked,
                        title: 'مرض آخر',
                      ),
                    ],
                  )
                : Column(
                    children: [],
                  ),
            CustomButtonPrimary(
              text: 'متابعة',
              onpressed: () {
                Get.toNamed(RouteHelper.coachSelection);
              },
            )
          ])),
    );
  }
}
