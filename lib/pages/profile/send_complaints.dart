import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';
import '../../widgets/CustomButtonPrimary.dart';

class SendComplaints extends StatelessWidget {
  const SendComplaints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),

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
                        "الشكاوى و الطلبات",
                        style: getBoldStyle(color: ColorManager.primary),
                      ),

                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 40.h,),
            Center(child: CustomTextTitle(text: "ارسال شكوى",)),
             Text(
              'عنوان الشكوى',
              style: TextStyle(fontSize: 12),
            ),
             SizedBox(
              height: 5.h,
            ),
            CustomTextFormAuth(
              hidepassword: false,
              textInputType: TextInputType.text,

                hintText: "اكتب العنوان هنا من فضلك"

            ),
             SizedBox(
              height: 10.h,
            ),
            Text(
              'الموضوع',
              style: TextStyle(fontSize: 12.sp),
            ),
            TextField(

              keyboardType: TextInputType.multiline,
              maxLines: 8,
              decoration: InputDecoration(
                fillColor: ColorManager.white,
                filled: true,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                hintText: "اكتب موضوع الشكوى",
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
                  borderSide:  BorderSide(
                    color: Colors.red,
                    width: 1.0.w,
                    style: BorderStyle.solid,
                  ),
                ),
              ),

            ),
            SizedBox(height: 60.h,),
            CustomButtonPrimary(text: "ارسال الشكوى ", onpressed: (){
              Get.toNamed(RouteHelper.requestsAndComplaints);
            }),



          ],

        ),
      ),
    );
  }
}
