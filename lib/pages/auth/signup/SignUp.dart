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
import 'package:provider/provider.dart';

import '../../../services/auth_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
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
                CustomTextTitle(
                  text: 'register'.tr,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'email'.tr,
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextFormAuth(
                  hidepassword: false,
                  myController: emailController,
                  textInputType: TextInputType.emailAddress,

                  hintText: 'email'.tr,
                  //  labelText: 'البريد الالكتروني / رقم الهاتف',
                  //  iconData: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'password'.tr,
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextFormAuth(
                  textInputType: TextInputType.visiblePassword,
                  hidepassword: provider.hidePass,
                  myController: passwordController,
                  pressSuffixIcon: () {
                    provider.changeHidePass();
                  },
                  hintText: 'password'.tr,
                  // labelText: 'كلمة المرور',
                  iconData: provider.hidePass
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                CustomButtonPrimary(
                  text: 'continue'.tr,
                  onpressed: () {
                    snakbarWidget(context,
                            Titel: 'completeRegister'.tr,
                            Description: 'قم باكمال عملة التسجيل')
                        .Success();
                    Get.offNamed(RouteHelper.signupPersonalData);
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextSignUpOrSignin(
                  textone: 'haveAccount'.tr,
                  texttwo: 'tryLogin'.tr,
                  onTap: () {
                    Get.offNamed(RouteHelper.getLogin());
                  },
                ),
              ],
            )),
      );
    });
  }
}
