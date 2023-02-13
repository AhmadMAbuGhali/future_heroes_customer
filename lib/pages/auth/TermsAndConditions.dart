import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/snakbar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../services/auth_provider.dart';

class TermsAndConditions extends StatelessWidget {
   TermsAndConditions({super.key});


  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return ColorManager.primary;
    }

    return Consumer<AuthProvider>(
        builder: (context, provider, x){
      return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 45.h,
                ),
                CustomTextTitle(
                  text: 'termsAndConditions'.tr,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Instructions".tr,
                  style: TextStyle(color: ColorManager.gray, fontSize: 12.h),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorManager.primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadiusDirectional.circular(10.r),
                      color: ColorManager.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                      "termBody".tr,
                        style: TextStyle(fontSize: 10.sp),

                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: provider.isChecked,
                      onChanged: (bool? value) {
                        provider.changeIsChecked(value);
                      },
                    ),
                    Text(
                      'agreeTerm'.tr,
                      style: TextStyle(fontSize: 12.h),
                    )
                  ],
                ),

                CustomButtonPrimary(
                  text: 'continue'.tr,
                  onpressed: () {
                    !provider.isChecked
                        ? snakbarWidget(context,
                        Titel: 'مرحبا بك',
                        Description: 'هذا الحقل مطلوب اجباري')
                        .error()
                        : Get.offNamed(RouteHelper.signUpPart2);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );});
  }
}
