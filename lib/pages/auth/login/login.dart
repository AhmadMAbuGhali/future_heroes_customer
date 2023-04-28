// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/pages/home/NoConnection.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/resources/styles_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/services/auth_provider.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/LogoAuth.dart';
import 'package:future_heroes_customer/widgets/textSignUp.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../../services/shared_preference_helper.dart';
import '../../../widgets/snakbar.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorManager.backGround,
        body: OfflineBuilder(
          child: Form(
            key: loginFormKey,
            child: Container(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Column(
                      children: [
                        const LogoAuth(),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: CustomTextTitle(
                            text: 'login'.tr,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              'email'.tr,
                              style: getBoldStyle(color: ColorManager.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomTextFormAuth(
                          hidepassword: false,
                          textInputType: TextInputType.emailAddress,
                          myController: provider.emailLoginPage,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'emailEmpty'.tr;
                            }
                            return null;
                          },
                          hintText: 'email'.tr,
                          //  labelText: 'البريد الالكتروني / رقم الهاتف',
                          //  iconData: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'password'.tr,
                              style: getBoldStyle(color: ColorManager.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextFormAuth(
                          textInputType: TextInputType.visiblePassword,
                          hidepassword: provider.showPasswordLogin,
                          pressSuffixIcon: () {
                            provider.changeShowPasswordLogin();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'passwordEmpty'.tr;
                            } else if (value.isValidPassword() == false) {
                              return 'invalidPassword'.tr;
                            } else if (value.isValidPassword() == true) {
                              return null;
                            }
                            return null;
                          },
                          myController: provider.passwordLoginPage,
                          hintText: 'password'.tr,
                          // labelText: 'كلمة المرور',
                          iconData: provider.showPasswordLogin
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        Row(
                          children: [
                            Switch(
                              value: provider.rememberMe,
                              onChanged: (bool) {
                                provider.changeRememberMe();
                              },
                              activeColor: ColorManager.primary,
                            ),
                            Text(
                              "rememberMe".tr,
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 12),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Get.toNamed(RouteHelper.forgetPassword);
                              },
                              child: Text(
                                'forgotPassword'.tr,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    color: ColorManager.primary, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        CustomButtonPrimary(
                          text: 'login'.tr,
                          onpressed: () async {
                            provider.changeIsLoding(true);
                            if (provider.loading == false) {
                              loginFormKey.currentState!.save();
                              await provider.login(provider.emailLoginPage.text,
                                  provider.passwordLoginPage.text, context);
                              if (loginFormKey.currentState!.validate()) {
                                String? statusString =
                                    getIt<SharedPreferenceHelper>().getStatus();
                                if (statusString == 'success') {
                                  await Get.offNamed(RouteHelper.successLogin);
                                } else {
                                  snakbarWidget(
                                    context,
                                    Titel: 'dataErorr'.tr,
                                    Description:
                                        'Make sure that Data is Good'.tr,
                                  ).error();
                                }
                              } else {
                                snakbarWidget(
                                  context,
                                  Titel: 'dataErorr'.tr,
                                  Description:
                                      'Make sure asdas that Data is Good'.tr,
                                ).error();
                              }
                            } else {
                              const CircularProgressIndicator();
                            }
                          },
                        ),
                        TextButton(
                            onPressed: () {
                              Get.offAndToNamed(RouteHelper.guestInitial);
                            },
                            child: Text(
                              'Loginasaguest'.tr,
                              style:
                                  const TextStyle(color: ColorManager.primary),
                            )),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomTextSignUpOrSignin(
                          onTap: () {
                            Get.toNamed(RouteHelper.signupPersonalData);
                          },
                          textone: 'dontHaveAccount'.tr,
                          texttwo: 'makeAccount'.tr,
                        ),
                      ],
                    ),
                  ),
                )),
          ),
          connectivityBuilder: (BuildContext context,
              ConnectivityResult connectivity, Widget child) {
            final bool connected = connectivity != ConnectivityResult.none;
            return connected ? child : NoConnectionScreen();
          },
        ),
      );
    });
  }
}
