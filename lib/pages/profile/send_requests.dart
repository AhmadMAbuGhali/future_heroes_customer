import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/services/auth_provider.dart';
import 'package:future_heroes_customer/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';
import '../../services/app_provider.dart';
import '../../widgets/CustomButtonPrimary.dart';

class SendRequests extends StatelessWidget {
  SendRequests({Key? key}) : super(key: key);
  TextEditingController titleController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                              'requestsAndComplaints'.tr,
                              style: getBoldStyle(color: ColorManager.primary),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                      child: CustomTextTitle(
                    text: 'sendRequest'.tr,
                  )),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'requestAddress'.tr,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomTextFormAuth(
                      hidepassword: false,
                      textInputType: TextInputType.text,
                      myController: titleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'emailEmpty'.tr;
                        } else if (value.isValidName() == false) {
                          return 'invalidEmail'.tr;
                        } else if (value.isValidName() == true) {
                          return null;
                        }
                        return null;
                      },
                      hintText: 'AddressHint'.tr),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'topic'.tr,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    controller: subjectController,
                    decoration: InputDecoration(
                      fillColor: ColorManager.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 14.h),
                      hintText: 'requestTopic'.tr,
                      hintStyle: getRegularStyle(
                          color: ColorManager.otpDesc, fontSize: FontSize.s14),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorManager.borderTextFiel, width: 1.0),
                          borderRadius: BorderRadius.circular(12.r)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                            color: ColorManager.primary, width: 1.0.w),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                            color: ColorManager.borderTextFiel, width: 1.0.w),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1.0.w,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  CustomButtonPrimary(
                      text: "sendRequest".tr,
                      onpressed: () {
                        provider.postOrder(titleController.text.trim(),
                            subjectController.text.trim());

                        Get.toNamed(RouteHelper.requestsAndComplaints);
                      }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
