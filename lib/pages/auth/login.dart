import 'package:flutter/material.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/LogoAuth.dart';
import 'package:future_heroes_customer/widgets/textSignUp.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                hidepassword: true,

                hintText: 'كلمة المرور',
                // labelText: 'كلمة المرور',
                iconData: Icons.remove_red_eye,
              ),
              const Text(
                'نسيت كلمة المرور',
                textAlign: TextAlign.end,
                style: TextStyle(color: ColorManager.primary, fontSize: 12),
              ),
              CustomButtonPrimary(
                text: 'تسجيل الدخول',
                onpressed: () {},
              ),
              const SizedBox(
                height: 50,
              ),
              const CustomTextSignUpOrSignin(
                textone: 'ليس لديك حساب ؟   ',
                texttwo: 'أنشئ حسابك الآن',
              ),
            ],
          )),
    );
  }
}
