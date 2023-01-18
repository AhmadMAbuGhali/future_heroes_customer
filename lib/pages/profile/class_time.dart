import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/class_time_widget.dart';
import 'package:get/get.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import '../../resources/styles_manager.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:ddlog/ddlog.dart';

class ClassTime extends StatefulWidget {
  const ClassTime({Key? key}) : super(key: key);

  @override
  State<ClassTime> createState() => _ClassTimeState();
}

class _ClassTimeState extends State<ClassTime> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 45.h,
                left: 20.w,
                right: 20.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "المستخدم",
                        style: getBoldStyle(color: ColorManager.primary),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            color: ColorManager.primary,
                          )),
                      
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 40.h,),
            CustomTextTitle(text: "مواعيد الحصص"),
            SizedBox(height: 18.h,),
            Text("هنا تجد مواعيد الحصص المخصصة لك حسب اشتراكك",textAlign: TextAlign.center, style: getBoldStyle(color: ColorManager.gray),),

            Expanded(child:ClassTimeWidget()),
          ],
        ),
      ),
    );
  }
 }