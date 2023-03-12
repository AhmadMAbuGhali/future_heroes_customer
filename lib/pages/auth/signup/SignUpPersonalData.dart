import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/services/auth_provider.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../widgets/textSignUp.dart';

class SignUpPersonalData extends StatelessWidget {
  SignUpPersonalData({super.key});

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
          key: _scaffoldKey,
          backgroundColor: ColorManager.backGround,
          body: Form(
            key: signUpFormKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),
                      Center(
                        child: CustomTextTitle(
                          text: 'personalDetails'.tr,
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: 100.h,
                          width: 100.w,
                          child: Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.expand,
                            children: [
                              CircleAvatar(
                                foregroundImage: provider.imageFile == null
                                    ? Image.asset(
                                        ImageAssets.avatar,
                                      ).image
                                    : Image.file(
                                        provider.imageFile!,
                                        fit: BoxFit.cover,
                                      ).image,
                                backgroundImage: provider.imageFile == null
                                    ? Image.asset(
                                        ImageAssets.avatar,
                                      ).image
                                    : Image.file(
                                        provider.imageFile!,
                                        fit: BoxFit.cover,
                                      ).image,
                              ),
                              Positioned(
                                  bottom: -7.h,
                                  right: -15.w,
                                  child: RawMaterialButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (builder) => bottomSheet(),
                                      );
                                    },
                                    elevation: 2.0,
                                    fillColor: Color(0xFFF5F6F9),
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.blue,
                                    ),
                                    padding: EdgeInsets.all(5.0),
                                    shape: CircleBorder(),
                                  )),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'email'.tr,
                        style: TextStyle(fontSize: 12),
                      ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      CustomTextFormAuth(
                        hidepassword: false,
                        textInputType: TextInputType.emailAddress,
                        myController: provider.emailSignUpPage,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'emailEmpty'.tr;
                          } else if (value.isValidEmail() == false) {
                            return 'invalidEmail'.tr;
                          } else if (value.isValidEmail() == true) {
                            return null;
                          }
                          return null;
                        },

                        hintText: 'email'.tr,
                        //  labelText: 'البريد الالكتروني / رقم الهاتف',
                        //  iconData: Icons.email_outlined,
                      ),
                      //  const SizedBox(
                      //     height: 10,
                      //   ),
                      Text(
                        'password'.tr,
                        style: TextStyle(fontSize: 12),
                      ),

                      CustomTextFormAuth(
                        textInputType: TextInputType.visiblePassword,
                        hidepassword: provider.showPasswordSignUp,
                        myController: provider.passwordSignUpPage,

                        pressSuffixIcon: () {
                          provider.changeShowPasswordSignUP();
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
                        hintText: 'password'.tr,
                        // labelText: 'كلمة المرور',
                        iconData: provider.showPasswordSignUp
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      Text(
                        'userName'.tr,
                        style: TextStyle(fontSize: 12),
                      ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      CustomTextFormAuth(
                        hidepassword: false,
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'userNameEmpty'.tr;
                          } else if (value.isValidName() == false) {
                            return 'invalidName'.tr;
                          } else if (value.isValidName() == true) {
                            return null;
                          }
                          return null;
                        },
                        hintText: 'userName'.tr,
                        myController: provider.nameSignUpPage,

                        //  labelText: 'البريد الالكتروني / رقم الهاتف',
                        //  iconData: Icons.email_outlined,
                      ),
                      Text(
                        'DOB'.tr,
                        style: TextStyle(fontSize: 12),
                      ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      CustomTextFormAuth(
                        myController: provider.dateTextInputSignUPPage,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'DOBEmpty'.tr;
                          }
                          return null;
                        },
                        pressSuffixIcon: () async {
                          provider.pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2100));
                          if (provider.pickedDate != null) {
                            print(provider.pickedDate);
                            String formattedDate = DateFormat('yyyy-MM-dd')
                                .format(provider.pickedDate!);
                            print(formattedDate);
                            provider.showDateText(formattedDate);
                          } else {}
                        },
                        hintText: 'YYYY/MM/DD',
                        iconData: Icons.calendar_month_outlined,
                      ),
                      Text(
                        'mobileNumber'.tr,
                        style: TextStyle(fontSize: 12),
                      ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      CustomTextFormAuth(
                        hidepassword: false,
                        textInputType: TextInputType.number,
                        iconData: Icons.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'mobileNumberEmpty'.tr;
                          } else if (value.isValidPhone() == false) {
                            return 'invalidPhone'.tr;
                          } else if (value.isValidPhone() == true) {
                            return null;
                          }
                          return null;
                        },
                        myController: provider.phoneSignUpPage,

                        hintText: 'mobileNumber'.tr,
                        //  labelText: 'البريد الالكتروني / رقم الهاتف',
                        //  iconData: Icons.email_outlined,
                      ),
                      CustomButtonPrimary(
                        text: 'continue'.tr,
                        onpressed: provider.isLoading == true
                            ? null
                            : () {
                                provider.changeIsLoding(true);
                                if (signUpFormKey.currentState!.validate()) {
                                  print(provider.imageFile!.path.toString());
                                  print(provider.nameSignUpPage.text);
                                  print(provider.phoneSignUpPage.text);
                                  print(provider.pickedDate.toString());
                                  print(provider.emailSignUpPage.text);
                                  print(provider.passwordSignUpPage.text);
                                  provider.register(
                                      provider.imageFile!,
                                      provider.nameSignUpPage.text,
                                      DateTime.now(),
                                      provider.phoneSignUpPage.text,
                                      provider.emailSignUpPage.text,
                                      provider.passwordSignUpPage.text);
                                  Get.toNamed(RouteHelper.termsAndConditions);
                                  print('success');
                                } else {
                                  print('failed');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Data Error')),
                                  );
                                }
                              },
                      ),
                      CustomTextSignUpOrSignin(
                        textone: 'haveAccount'.tr,
                        texttwo: 'tryLogin'.tr,
                        onTap: () {
                          Get.offNamed(RouteHelper.getLogin());
                        },
                      ),
                    ]),
              ),
            ),
          ));
    });
  }

  Widget bottomSheet() {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
        height: 220.h,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'changePhoto'.tr,
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomButtonPrimary(
                text: "openCamera".tr,
                onpressed: () {
                  provider.openCamera(context);
                }),
            SizedBox(
              height: 10.h,
            ),
            Text("or".tr),
            CustomButtonPrimary(
                text: "openGallery".tr,
                onpressed: () {
                  provider.openGallery(context);
                }),
          ],
        ),
      );
    });
  }
}
