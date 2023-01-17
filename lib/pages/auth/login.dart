import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/LogoAuth.dart';
import 'package:future_heroes_customer/widgets/snakbar.dart';
import 'package:future_heroes_customer/widgets/textSignUp.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool remmberMe = false;
  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: ListView(
            children: [
              const LogoAuth(),
              const SizedBox(
                height: 10,
              ),
              const CustomTextTitle(
                text: 'تسجيل الدخول',
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'البريد الالكتروني / رقم الهاتف',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormAuth(
                hidepassword: false,
                textInputType: TextInputType.emailAddress,

                hintText: 'البريد الالكتروني / رقم الهاتف',
                //  labelText: 'البريد الالكتروني / رقم الهاتف',
                //  iconData: Icons.email_outlined,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'كلمة المرور',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormAuth(
                textInputType: TextInputType.visiblePassword,
                hidepassword: hidePass,
                pressSuffixIcon: () {
                  setState(() {
                    hidePass = !hidePass;
                  });
                },
                hintText: 'كلمة المرور',
                // labelText: 'كلمة المرور',
                iconData: hidePass ? Icons.visibility : Icons.visibility_off,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Switch(
                    value: remmberMe,
                    onChanged: (bool) {
                      setState(() {
                        remmberMe = bool;
                      });
                    },
                    activeColor: ColorManager.primary,
                  ),
                  const Text(
                    'نسيت كلمة المرور',
                    textAlign: TextAlign.end,
                    style: TextStyle(color: ColorManager.primary, fontSize: 12),
                  ),
                ],
              ),
              CustomButtonPrimary(
                text: 'تسجيل الدخول',
                onpressed: () {
                  snakbarWidget(context,
                          Titel: 'هناك خطأ ما ',
                          Description: 'اعد الماولة مجدداً من فضلك')
                      .Success();
                  Get.offNamed(RouteHelper.getSuccessLogin());
                },
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextSignUpOrSignin(
                textone: 'ليس لديك حساب ؟   ',
                texttwo: 'أنشئ حسابك الآن',
                onTap: () {
                  Get.offNamed(RouteHelper.getSignUp());
                },
              ),
            ],
          )),
    );
  }
}
