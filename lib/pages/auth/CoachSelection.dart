import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/pages/auth/CardWidget.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/CardCheckBoxWidget.dart';
import 'package:future_heroes_customer/widgets/snakbar.dart';
import 'package:get/route_manager.dart';

import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';

List<String> list = <String>[
  '04:00 - 05:00',
  '01:00 - 02:00',
  '03:00 - 04:00',
];

class CoachSelection extends StatefulWidget {
  const CoachSelection({super.key});

  @override
  State<CoachSelection> createState() => _CoachSelectionState();
}

class _CoachSelectionState extends State<CoachSelection> {
  String dropdownValue = list.first;
  bool isCoachSelection = false;
  final List<String> items = [
    '04:00 - 05:00 ',
    '01:00 - 02:00 ',
    '03:00 - 04:00 ',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: ListView(children: [
            CustomTextTitle(
              text: ' اختيار المدرب',
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              '''اختر من القائمة , المدرب الذي ترغب بالانضمام 
لطلابه''',
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorManager.gray),
            ),
            Text('قسم الرياضة'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: isCoachSelection
                          ? null
                          : Border.all(
                              color: ColorManager.primary,
                              width: 2,
                            )),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          isCoachSelection = false;
                        });
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/avatar.png',
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            'م.محمد',
                            style: getRegularStyle(color: ColorManager.primary),
                          ),

                        ],
                      )),
                ),
                InkWell(
                  focusColor: ColorManager.primary,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    setState(() {
                      isCoachSelection = true;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          border: isCoachSelection
                              ? Border.all(
                                  color: ColorManager.primary,
                                  width: 2,
                                )
                              : null),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/avatar.png',
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            'م.احمد',
                           style: getRegularStyle(color: ColorManager.primary),
                          ),

                        ],
                      )),
                ),
              ],
            ),
            isCoachSelection
                ? Column(
                    children: [
                      Text(
                        'الحصص الخاصة ب الكوتش محمد',
                        style: TextStyle(color: ColorManager.black),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CardWidget(
                        title: 'السبت / الاثنين / الأربعاء  ',
                      ),
                      Text(
                        'مواعيد الحصص المتاحة',
                        style: TextStyle(color: ColorManager.black),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 15.w),
                        margin: EdgeInsets.symmetric(vertical: 5.h),
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorManager.gray),
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          elevation: 16,
                          style: const TextStyle(color: ColorManager.primary),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [],
                  ),
            CustomButtonPrimary(
              text: 'متابعة',
              onpressed: () {
                Get.toNamed(RouteHelper.subscriptionType);
              },
            )
          ])),
    );
  }
}
