import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:get/get.dart';

class DateWidget extends StatefulWidget {
  String? date;
  String? timeStart;
  String? timeEnd;
  String? name;
  String? type;
  String? duration;
  Function()? onTap;
  DateWidget(
      {super.key,
      this.date,
      this.timeStart,
      this.timeEnd,
      this.name,
      this.type,
      this.duration,
      this.onTap});

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return isExpanded
        ? InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Column(
              children: [
                Container(
                  height: 80.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.primary),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: ColorManager.primary,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.date.toString(),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  color: ColorManager.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5.h,),
                            Row(
                              children: [
                                Text(
                                  widget.timeStart.toString(),
                                  style: TextStyle(
                                      color: ColorManager.gray,
                                      fontWeight: FontWeight.normal),
                                ),
                                const Text(" --> "),
                                Text(
                                  widget.timeEnd.toString(),
                                  style: TextStyle(
                                      color: ColorManager.gray,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: ColorManager.primary,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        : InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.primary),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: ColorManager.primary,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.date.toString(),
                              style: const TextStyle(
                                  color: ColorManager.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height:7.h ,),
                            Row(
                              children: [
                                Text(
                                  widget.timeStart.toString(),
                                  style: TextStyle(
                                      color: ColorManager.gray,
                                      fontWeight: FontWeight.normal),
                                ),
                                const Text(" --> "),
                                Text(
                                  widget.timeEnd.toString(),
                                  style: TextStyle(
                                      color: ColorManager.gray,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            SizedBox(height:7.h ,),
                            Row(
                              children: [
                                Text(
                                  'nameCoach'.tr,
                                  style: const TextStyle(
                                      color: ColorManager.primary,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.name.toString(),
                                  style: TextStyle(
                                      color: ColorManager.gray,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            SizedBox(height:7.h ,),
                            Row(
                              children: [
                                Text(
                                  'class'.tr,
                                  style: const TextStyle(
                                      color: ColorManager.primary,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.type.toString(),
                                  style: TextStyle(
                                      color: ColorManager.gray,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            SizedBox(height:7.h ,),
                            Row(
                              children: [
                                Text(
                                  'classtime'.tr,
                                  style: const TextStyle(
                                      color: ColorManager.primary,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.duration.toString(),
                                  style: TextStyle(
                                      color: ColorManager.gray,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            SizedBox(height:7.h ,),
                            ElevatedButton(
                              onPressed: widget.onTap,
                              style: ElevatedButton.styleFrom(
                                // shape: RoundedRectangleBorder(
                                //     borderRadius:
                                //         BorderRadius.circular(10.r)),
                                foregroundColor: ColorManager.white,
                                side: const BorderSide(color: ColorManager.primary),
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                primary: ColorManager.white,
                                textStyle: TextStyle(
                                  fontFamily: 'DroidKufi',
                                  fontSize: 16.sp,
                                ),
                              ),

                              child: Container(
                                width: 140.w,
                                height: 30.h,
                                padding: const EdgeInsets.all(6),
                                child: Center(
                                  child: Text(
                                    'requestPostponement'.tr,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: ColorManager.primary),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h,)
                            //    CustomButtonPrimary(
                            //   onpressed: () {},
                            //   text: 'طلب تأجيل',
                            //   textColor: ColorManager.primary,
                            //   buttonColor: ColorManager.white,
                            // )
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.keyboard_arrow_up,
                          color: ColorManager.primary,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          );
  }
}
