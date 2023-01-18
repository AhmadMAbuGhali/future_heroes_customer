import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
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

class SignUpScreenPart2 extends StatefulWidget {
  const SignUpScreenPart2({super.key});

  @override
  State<SignUpScreenPart2> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreenPart2> {
  bool remmberMe = false;
  bool hidePass = true;
  bool isCultural = false;
  bool isChecked = false;
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
                text: ' !اهلا وسهلا بك',
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'الى أي فئة ترغب الانضمام',
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorManager.gray),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: isCultural
                            ? null
                            : Border.all(
                                color: ColorManager.primary,
                                width: 2,
                              )),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isCultural = false;
                        });
                      },
                      child: SvgPicture.asset(
                        ImageAssets.sport,
                        height: 100.h,
                        width: 100.h,
                      ),
                    ),
                  ),
                  InkWell(
                    focusColor: ColorManager.primary,
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      setState(() {
                        isCultural = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: isCultural
                              ? Border.all(
                                  color: ColorManager.primary,
                                  width: 2,
                                )
                              : null),
                      child: SvgPicture.asset(
                        ImageAssets.cultural,
                        height: 100.h,
                        width: 100.h,
                      ),
                    ),
                  ),
                ],
              ),
              isCultural
                  ? Column(
                      children: [
                        CardCheckBoxWidget(
                          isChecked: isChecked,
                          title: 'نحت',
                        ),
                        CardCheckBoxWidget(
                          isChecked: isChecked,
                          title: 'خط',
                        ),
                        CardCheckBoxWidget(
                          isChecked: isChecked,
                          title: 'رسم',
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        CardCheckBoxWidget(
                          isChecked: isChecked,
                          title: 'كاراتيه',
                        ),
                        CardCheckBoxWidget(
                          isChecked: isChecked,
                          title: 'تايكواندو',
                        ),
                        CardCheckBoxWidget(
                          isChecked: isChecked,
                          title: 'جمباز',
                        ),
                      ],
                    ),
              CustomButtonPrimary(
                text: 'متابعة',
                onpressed: () {
                  snakbarWidget(context,
                          Titel: 'مرحبا بك',
                          Description: 'قم باكمال عملة التسجيل')
                      .Success();
                  Get.offNamed(RouteHelper.termsAndConditions);
                },
              ),
            ],
          )),
    );
  }
}