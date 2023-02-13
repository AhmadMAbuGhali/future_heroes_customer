import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../services/auth_provider.dart';

class SignUpPersonalData extends StatelessWidget {
   SignUpPersonalData({super.key});




  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, provider, x){
          return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                                    builder: (builder) => provider.bottomSheet(),
                                  );
                                },
                                elevation: 2.0,
                                fillColor: Color(0xFFF5F6F9),
                                child: Icon(Icons.camera_alt_outlined, color: Colors.blue,),
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
                hidepassword: provider.hidePass,
                pressSuffixIcon: () {
                 provider.changeHidePass();
                },
                hintText: 'password'.tr,
                // labelText: 'كلمة المرور',
                iconData: provider.hidePass ? Icons.visibility : Icons.visibility_off,
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
                textInputType: TextInputType.emailAddress,

                hintText: 'userName'.tr,

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
                myController: provider.dateTextInput,
                pressSuffixIcon: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));
                  if (pickedDate != null) {
                    print(pickedDate);
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
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
                hintText: 'mobileNumber'.tr,
                //  labelText: 'البريد الالكتروني / رقم الهاتف',
                //  iconData: Icons.email_outlined,
              ),
              CustomButtonPrimary(
                text: 'continue'.tr,
                onpressed: () {
                  Get.toNamed(RouteHelper.termsAndConditions);
                },
              ),
            ]),
          ),
        ));});
  }




}
