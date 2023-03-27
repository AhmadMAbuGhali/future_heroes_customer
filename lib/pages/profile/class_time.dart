import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/widgets/dateWidget.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/class_time_widget.dart';
import 'package:get/get.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:provider/provider.dart';
import '../../resources/styles_manager.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:ddlog/ddlog.dart';

import '../../services/app_provider.dart';

class ClassTime extends StatefulWidget {
  const ClassTime({Key? key}) : super(key: key);

  @override
  State<ClassTime> createState() => _ClassTimeState();
}

class _ClassTimeState extends State<ClassTime> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(

              padding: EdgeInsets.only(
                top: 45.h,
                // left: 20.w,
                // right: 20.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: ColorManager.primary,
                          )),
                      Text(
                        "user".tr,
                        style: getBoldStyle(color: ColorManager.primary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomTextTitle(text: "classTime".tr),
            SizedBox(
              height: 18.h,
            ),
            Text(
              "classTimeHint".tr,
              textAlign: TextAlign.center,
              style: getBoldStyle(color: ColorManager.gray),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: provider.classTime.length,
                  itemBuilder: (context,index){return DateWidget(
                timeStart: provider.classTime[index]!.startTime,
                timeEnd: provider.classTime[index]!.endTime,
                date: provider.classTime[index]!.classEnd!.split("T").first,
                name: provider.classTime[index]!.classLecture!.coachName,
                duration: provider.classTime[index]!.duration,
                type: provider.classTime[index]!.classLecture!.name,
                onTap: () {
                  provider.setId(provider.classTime[index]!.id!);
                  print(provider.id);
                  Get.toNamed(RouteHelper.postponeAnAppointment);
                },
              ); }),
            )


          ],
        ),
      ),
    );});
  }
}
