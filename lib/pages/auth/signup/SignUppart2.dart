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

import '../../../data/api/apiconst.dart';

class SignUpScreenPart2 extends StatelessWidget {
  SignUpScreenPart2({super.key});
  var id;
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
                  height: 200.h,
                  child: ListView.builder(

                    scrollDirection: Axis.horizontal,
                      itemCount: provider.categoryMain.length,
                      itemBuilder: (context,index){
                      return  InkWell(
                        onTap: (){
                         id=   provider.categoryMain[index].id;

                        },
                        child: Container(
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
                               provider.categoryMain[index].imageString==""? SvgPicture.asset(
                                  ImageAssets.cultural,
                                  height: 120.h,
                                  width: 120.w,
                                ):Image.network(ApiConstant.imageURL+ provider.categoryMain[index].imageString!,height: 120.h,
                                 width: 120.w,),
                                Text(provider.categoryMain[index].name ??' null')
                              ],
                            ),
                          ),
                      );
                    return Text(provider.categoryMain[index].name ??' nullß');
                  }),
                ),

                SizedBox(
                  height: 170.h,
                  child: ListView.builder(

                      scrollDirection: Axis.vertical,
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
                              CardCheckBoxWidget(
                                isChecked: provider.isChecked,
                                title: provider.categorySub[index].name ??' null' ,
                              ),
                            ],
                          ),
                        );
                        return Text(provider.categoryMain[index].name ??' nullß');
                      }),
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
