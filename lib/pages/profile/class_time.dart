import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/dateWidget.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../resources/styles_manager.dart';
import '../../services/app_provider.dart';
import '../home/NoConnection.dart';

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
      body: OfflineBuilder(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                            icon: const Icon(
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
                height: 10.h,
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
                  timeStart: provider.classTime[index].startTime,
                  timeEnd: provider.classTime[index].endTime,
                      date: shaedpref.getString("curruntLang") ==
                          "ar"
                          ? "${provider
                          .daysAr[provider.classTime[index].day]!}  : ${provider.classTime[index].classEnd!
                              .split("T")
                              .first}"
                          : "${provider.daysEn[
                      provider.classTime[index].day]!}  : ${provider.classTime[index].classEnd!
                              .split("T")
                              .first}",                name: provider.classTime[index].classLecture!.coachName,
                  duration: provider.classTime[index].duration,
                  type: provider.classTime[index].classLecture!.name,
                  onTap: () async {
                    provider.setPostponeId(provider.classTime[index].id!);

                    await Get.toNamed(RouteHelper.postponeAnAppointment);
                  },
                ); }),
              )


            ],
          ),
        ),
        connectivityBuilder:
            (BuildContext context, List<ConnectivityResult> connectivity, Widget child) {
          final bool connected = connectivity.contains(ConnectivityResult.mobile) ||
              connectivity.contains(ConnectivityResult.wifi);
          return connected ? child : NoConnectionScreen();
        },
      ),
    );});
  }
}
