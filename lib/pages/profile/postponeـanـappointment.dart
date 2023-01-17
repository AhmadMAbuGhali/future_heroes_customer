import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';
import '../../widgets/CustomButtonPrimary.dart';
import '../../widgets/CustomTextFormAuth.dart';
import '../../widgets/CustomTextTitle.dart';

class PostponeAnAppointment extends StatelessWidget {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController vestRController = TextEditingController();
  final TextEditingController detialController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
   PostponeAnAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        "مواعيد الحصص",
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
                  )
                ],
              ),
            ),
            SizedBox(height: 40.h,),
            Center(child: CustomTextTitle(text: "طلب تأجيل موعد",)),
            SizedBox(height: 15.h,),
            Text(
              'سبب التأجيل',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextFormAuth(
                hidepassword: false,
                textInputType: TextInputType.text,

                hintText: "اكتب العنوان الرئيسي لطلب التأجيل"

            ),
            SizedBox(height: 16.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'التاريخ',
                  style: getMediumStyle(
                      color: ColorManager.black, fontSize: FontSize.s14),
                ),
                const Spacer(),
                Text(
                  'الوقت',
                  style: getMediumStyle(
                      color: ColorManager.black, fontSize: FontSize.s14),
                ),
                const Spacer(),

              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 165.w,
                  child: TextField(
                    controller: dateController,
                    //editing controller of this TextField
                    decoration: InputDecoration(
                      hintText: 'اختار التاريح',
                      hintStyle: getMediumStyle(
                          color: ColorManager.gray,
                          fontSize: FontSize.s16),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 10.h),
                      fillColor: ColorManager.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                              ColorManager.gray666,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(12.r)),
                    ),
                    readOnly: true,
                    //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        String formattedDate =
                        DateFormat('d/M/yyyy').format(pickedDate);
                        dateController.text = formattedDate;
                        // enddatetime = pickedDate;

                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 165.w,
                  child: TextField(
                    controller: timeController,
                    decoration: InputDecoration(
                      hintText: 'اختار الوقت',
                      hintStyle: getMediumStyle(
                          color: ColorManager.gray,
                          fontSize: FontSize.s16),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 10.h),
                      fillColor: ColorManager.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorManager.gray666,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(12.r)),
                    ),
                    readOnly: true,
                    onTap: () async {
                      final TimeOfDay? timeOfDay = await showTimePicker(
                        context: context,
                        initialTime: selectedTime,
                        initialEntryMode: TimePickerEntryMode.dial,
                      );
                      if (timeOfDay != null && timeOfDay != selectedTime) {
                        selectedTime = timeOfDay;
                        timeController.text = selectedTime.format(context);

                      }
                    },
                  ),
                ),
              ],),
            SizedBox(height: 16.h,),
            Text(
              'تفاصيل اخرى',
              style: TextStyle(fontSize: 12),
            ),
            TextField(

              keyboardType: TextInputType.multiline,
              maxLines: 8,
              decoration: InputDecoration(
                fillColor: ColorManager.white,
                filled: true,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                hintText: "اكتب العنوان الرئيسي لطلب التأجيل",
                hintStyle: getRegularStyle(
                    color: ColorManager.otpDesc, fontSize: FontSize.s14),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorManager.borderTextFiel, width: 1.0),
                    borderRadius: BorderRadius.circular(12.r)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: ColorManager.primary, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                      color: ColorManager.borderTextFiel, width: 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                ),
              ),

            ),
            SizedBox(height: 15.h,),
            CustomButtonPrimary(text: "ارسال الطلب ", onpressed: (){
              Get.toNamed(RouteHelper.initial);
            }),
          ],
        ),
      ),
    );
  }
}
