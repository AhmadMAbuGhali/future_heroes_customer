import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/custom_text_feild.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';
import '../../services/app_provider.dart';
import '../../services/shared_preference_helper.dart';
import '../../widgets/CustomButtonPrimary.dart';
import '../../widgets/CustomTextFormAuth.dart';

class PersonalData extends StatefulWidget {
  PersonalData({Key? key}) : super(key: key);

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  TextEditingController? name = TextEditingController();
  bool hidePass = true;
  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                        "user".tr,
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
              text: 'personalDetails'.tr,
            )),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'email'.tr,
              style: getRegularStyle(color: Colors.black),
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              width: double.infinity,
              height: 44.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: ColorManager.primary,width: 1)
              ),
              child: Text(provider.profileData!.email??"",style: getRegularStyle(color: ColorManager.black),),
            ),
            // CustomTextFormAuth(
            //   hidepassword: false,
            //   textInputType: TextInputType.emailAddress,
            //
            //   hintText: provider.profileData!.email??"",
            //
            //   //  labelText: 'البريد الالكتروني / رقم الهاتف',
            //   //  iconData: Icons.email_outlined,
            // ),
            //
            SizedBox(
              height: 10.h,
            ),
            Text(
              'userName'.tr,
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              height: 10.h,
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              width: double.infinity,
              height: 44.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: ColorManager.primary,width: 1)
              ),
              child: Text(provider.profileData!.fullName??"",style: getRegularStyle(color: ColorManager.black),),
            ),

            SizedBox(
              height: 10.h,
            ),
            Text(
              'DOB'.tr,
              style: TextStyle(fontSize: 12.sp),
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              width: double.infinity,
              height: 44.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: ColorManager.primary,width: 1)
              ),
              child: Text(provider.profileData!.dateOfBirth!.split("T").first??"",style: getRegularStyle(color: ColorManager.black),),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'mobileNumber'.tr,
              style: TextStyle(fontSize: 12.sp),
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              width: double.infinity,
              height: 44.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: ColorManager.primary,width: 1)
              ),
              child: Text(provider.profileData!.phoneNumber??"",style: getRegularStyle(color: ColorManager.black),),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
                child: TextButton(
                    onPressed: () {
                      print({getIt<SharedPreferenceHelper>()
                          .getUserToken()});
                      Get.toNamed(RouteHelper.changePassword);
                    },
                    child: Text(
                      'changePassword'.tr,
                      textAlign: TextAlign.center,
                      style: getBoldStyle(
                          color: ColorManager.primary, fontSize: 14.sp),
                    ))),
            SizedBox(
              height: 20.h,
            ),
            CustomButtonPrimary(
                text: "save".tr,
                onpressed: () {
                  Get.toNamed(RouteHelper.initial);
                }),
          ],
        ),
      ),
    );});
  }
}
