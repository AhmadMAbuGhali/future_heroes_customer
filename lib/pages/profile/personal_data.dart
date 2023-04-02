import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/custom_text_feild.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/api/apiconst.dart';
import '../../main.dart';
import '../../resources/assets_manager.dart';
import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';
import '../../services/app_provider.dart';
import '../../services/shared_preference_helper.dart';
import '../../widgets/CustomButtonPrimary.dart';
import '../../widgets/CustomTextFormAuth.dart';

class PersonalData extends StatefulWidget {
  PersonalData({Key? key}) : super(key: key);

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  TextEditingController? name = TextEditingController();
  bool hidePass = true;
  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.backGround,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.back();
                                provider.getProfileData();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: ColorManager.primary,
                              )),
                          Text(
                            "user".tr,
                            style: getBoldStyle(color: ColorManager.primary),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                    child: CustomTextTitle(
                  text: 'personalDetails'.tr,
                )),
                SizedBox(
                  height: 10.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80.h,
                      width: 80.w,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          CircleAvatar(
                            foregroundImage:
                                provider.profileData!.imageString == null
                                    ? Image.asset(
                                        ImageAssets.avatar,
                                      ).image
                                    : provider.imageFile == null
                                        ? Image.network(
                                            ApiConstant.imageURL +
                                                provider
                                                    .profileData!.imageString!,
                                            fit: BoxFit.cover,
                                          ).image
                                        : Image.file(
                                            provider.imageFile!,
                                            fit: BoxFit.cover,
                                          ).image,
                            backgroundImage:
                                provider.profileData!.imageString == null
                                    ? Image.asset(
                                        ImageAssets.avatar,
                                      ).image
                                    : provider.imageFile == null
                                        ? Image.network(
                                            ApiConstant.imageURL +
                                                provider
                                                    .profileData!.imageString!,
                                            fit: BoxFit.cover,
                                          ).image
                                        : Image.file(
                                            provider.imageFile!,
                                            fit: BoxFit.cover,
                                          ).image,
                          ),
                          Positioned(
                              bottom: -10.h,
                              right: -35.w,
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
                  ],
                ),

                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'email'.tr,
                  style: getRegularStyle(color: Colors.black),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: double.infinity,
                  height: 44.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: ColorManager.gray, width: 1)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            provider.profileData!.email ?? "",
                            style: getRegularStyle(color: ColorManager.gray),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'userName'.tr,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),

                Container(
                  width: double.infinity,
                  height: 44.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: ColorManager.gray, width: 1)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            provider.profileData!.fullName ?? "",
                            style: getRegularStyle(color: ColorManager.gray),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'DOB'.tr,
                  style: TextStyle(fontSize: 12.sp),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: double.infinity,
                  height: 44.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: ColorManager.gray, width: 1)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            provider.profileData!.dateOfBirth!
                                    .split("T")
                                    .first ??
                                "",
                            style: getRegularStyle(color: ColorManager.gray),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'mobileNumber'.tr,
                  style: TextStyle(fontSize: 12.sp),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: double.infinity,
                  height: 44.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: ColorManager.gray, width: 1)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            provider.profileData!.phoneNumber ?? "",
                            style: getRegularStyle(color: ColorManager.gray),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),

                CustomButtonPrimary(
                  text: "changePassword".tr,
                  onpressed: () {
                    print({getIt<SharedPreferenceHelper>().getUserToken()});
                    Get.toNamed(RouteHelper.changePassword);
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomButtonPrimary(
                  text: "save".tr,
                  onpressed: () async {
                    try{
                     await provider.updateImage(provider.imageFile!);
                      print("Joe");
                      print(provider.imageFile!.path);
                    }catch(e){
                      print(e.toString());
                    }

                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget bottomSheet() {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
        height: 200.h,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'changePhoto'.tr,
            ),
            SizedBox(
              height: 20,
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
