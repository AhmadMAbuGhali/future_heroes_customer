import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:future_heroes_customer/data/api/dio_client.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/services/auth_provider.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/LogoAuth.dart';
import 'package:future_heroes_customer/widgets/CardCheckBoxWidget.dart';
import 'package:future_heroes_customer/widgets/snakbar.dart';
import 'package:future_heroes_customer/widgets/textSignUp.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:provider/provider.dart';

class SignUpScreenPart2 extends StatelessWidget {
  SignUpScreenPart2({super.key});

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorManager.primary;
      }
      return ColorManager.primary;
    }

    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: ListView(
              children: [
                const LogoAuth(),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextTitle(
                  text: 'welcome'.tr,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'whatCategory'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorManager.gray),
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  height: 200.h,
                  child: ListView.builder(

                    scrollDirection: Axis.horizontal,
                      itemCount: provider.categoryMain.length,
                      itemBuilder: (context,index){
                      return  Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                          decoration: BoxDecoration(
                              border: provider.isCultural
                                  ? Border.all(
                                color: ColorManager.primary,
                                width: 2,
                              )
                                  : null),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                ImageAssets.cultural,
                                height: 100.h,
                                width: 100.h,
                              ),
                              Text(provider.categoryMain[index].name ??' null')
                            ],
                          ),
                        );
                    return Text(provider.categoryMain[index].name ??' nullß');
                  }),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Container(
                //       decoration: BoxDecoration(
                //           border: provider.isCultural
                //               ? null
                //               : Border.all(
                //                   color: ColorManager.primary,
                //                   width: 2,
                //                 )),
                //       child: InkWell(
                //         onTap: () {
                //           provider.makeCulturalFalse();
                //         },
                //         child: Column(
                //           children: [
                //             SvgPicture.asset(
                //               ImageAssets.sport,
                //               height: 100.h,
                //               width: 100.h,
                //             ),
                //             Text("sport".tr),
                //           ],
                //         ),
                //       ),
                //     ),
                //     InkWell(
                //       focusColor: ColorManager.primary,
                //       borderRadius: BorderRadius.circular(10),
                //       onTap: () {
                //         provider.makeCulturalTrue();
                //       },
                //       child: Container(
                //         decoration: BoxDecoration(
                //             border: provider.isCultural
                //                 ? Border.all(
                //                     color: ColorManager.primary,
                //                     width: 2,
                //                   )
                //                 : null),
                //         child: Column(
                //           children: [
                //             SvgPicture.asset(
                //               ImageAssets.cultural,
                //               height: 100.h,
                //               width: 100.h,
                //             ),
                //             Text("cultural".tr)
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                provider.isCultural
                    ? Column(
                        children: [
                          CardCheckBoxWidget(
                            isChecked: provider.isChecked,
                            title: 'Sculpture'.tr,
                          ),
                          CardCheckBoxWidget(
                            isChecked: provider.isChecked,
                            title: 'font'.tr,
                          ),
                          CardCheckBoxWidget(
                            isChecked: provider.isChecked,
                            title: 'drawing'.tr,
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          CardCheckBoxWidget(
                            isChecked: provider.isChecked,
                            title: 'Karate'.tr,
                          ),
                          CardCheckBoxWidget(
                            isChecked: provider.isChecked,
                            title: 'taekwondo'.tr,
                          ),
                          CardCheckBoxWidget(
                            isChecked: provider.isChecked,
                            title: 'Gymnastics'.tr,
                          ),
                        ],
                      ),
                CustomButtonPrimary(
                  text: 'continue'.tr,
                  onpressed: () {
                     snakbarWidget(context,
                            Titel: 'مرحبا بك',
                            Description: 'قم باكمال عملة التسجيل')
                        .Success();
                    Get.offNamed(RouteHelper.coachSelection);
                  },
                ),
              ],
            )),
      );
    });
  }
}
