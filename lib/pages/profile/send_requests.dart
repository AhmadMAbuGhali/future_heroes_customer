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

class SendRequests extends StatelessWidget {
  const SendRequests({Key? key}) : super(key: key);

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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "الشكاوى و الطلبات",
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
            Center(child: CustomTextTitle(text: "ارسال طلب",)),
            Text(
              'عنوان الطلب',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextFormAuth(
                hidepassword: false,
                textInputType: TextInputType.text,

                hintText: "اكتب العنوان هنا من فضلك"

            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'الموضوع',
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
                hintText: "اكتب موضوع الطلب",
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
            SizedBox(height: 60.h,),
            CustomButtonPrimary(text: "ارسال الطلب ", onpressed: (){
              Get.toNamed(RouteHelper.requestsAndComplaints);
            }),



          ],

        ),
      ),
    );
  }
}
