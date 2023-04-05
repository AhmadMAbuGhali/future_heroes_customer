import 'package:ddlog/ddlog.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';
import '../routes/route_helper.dart';

class ClassTimeWidget extends StatefulWidget {
  const ClassTimeWidget({Key? key}) : super(key: key);

  @override
  State<ClassTimeWidget> createState() => _ClassTimeWidgetState();
}

class _ClassTimeWidgetState extends State<ClassTimeWidget> {
  int groupValue = 0;
  StepperType _type = StepperType.vertical;

  List<Widget> tuples = [
    Container(
      width: 15.w,
      height: 15.h,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: ColorManager.primary),
    ),
    Container(
      width: 15.w,
      height: 15.h,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: ColorManager.primary),
    ),
    Container(
      width: 15.w,
      height: 15.h,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: ColorManager.primary),
    ),
    Container(
      width: 15.w,
      height: 15.h,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: ColorManager.primary),
    ),
  ];

  int _index = 1;
  @override
  Widget build(BuildContext context) {
    return buildStepperCustom(context);
  }

  void go(int index) {
    if (index == -1 && _index <= 0) {
      ddlog("it's first Step!");
      return;
    }

    if (index == 1 && _index >= tuples.length - 1) {
      ddlog("it's last Step!");
      return;
    }

    setState(() {
      _index += index;
    });
  }

  Widget buildStepperCustom(BuildContext context) {
    return EnhanceStepper(
        // stepIconSize: 60,
        type: _type,
        horizontalTitlePosition: HorizontalTitlePosition.bottom,
        horizontalLinePosition: HorizontalLinePosition.center,
        currentStep: _index,
        physics: const ClampingScrollPhysics(),
        steps: tuples
            .map((e) => EnhanceStep(
                  icon: Icon(
                    Icons.circle,
                    // Icons.add,
                    color: ColorManager.primary,
                    size: 16.h,
                  ),
                  state: StepState.values[tuples.indexOf(e)],
                  isActive: _index == tuples.indexOf(e),
                  title: Text(
                    "13/01/2023",
                    style: getRegularStyle(color: ColorManager.primary),
                  ),
                  subtitle: const Text(
                    "10:30 - 11:30",
                  ),
                  content: Text("classTimeBody".tr),
                ))
            .toList(),
        onStepCancel: () {
          go(-1);
        },
        onStepContinue: () {
          go(1);
        },
        onStepTapped: (index) {
          ddlog(index);
          setState(() {
            _index = index;
          });
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Row(
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 35.h,
                width: 80.w,
                child: ElevatedButton(
                  onPressed: details.onStepContinue,
                  style:
                      ElevatedButton.styleFrom(primary: ColorManager.primary),
                  child: Text(
                    "next".tr,
                    style: getRegularStyle(color: ColorManager.white),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                height: 35.h,
                width: 160.w,
                child: TextButton(
                  onPressed: () {

                    Get.toNamed(RouteHelper.postponeAnAppointment);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: ColorManager.white,
                      side: const BorderSide(width: 1, color: ColorManager.primary)),
                  child: Text(
                    "requestPostponement".tr,
                    style: getRegularStyle(color: ColorManager.primary),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
