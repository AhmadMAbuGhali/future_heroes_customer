import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/profile_section.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../resources/assets_manager.dart';
import '../../resources/styles_manager.dart';
import '../../widgets/CustomButtonPrimary.dart';

class GuestProfilePage extends StatefulWidget {
  const GuestProfilePage({Key? key}) : super(key: key);

  @override
  State<GuestProfilePage> createState() => _GuestProfilePageState();
}

class _GuestProfilePageState extends State<GuestProfilePage> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  height: 80.h,
                  width: 80.w,
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      CircleAvatar(
                        foregroundImage: imageFile == null
                            ? Image.asset(
                                ImageAssets.avatar,
                              ).image
                            : Image.file(
                                imageFile!,
                                fit: BoxFit.cover,
                              ).image,
                        backgroundImage: imageFile == null
                            ? Image.asset(
                                ImageAssets.avatar,
                              ).image
                            : Image.file(
                                imageFile!,
                                fit: BoxFit.cover,
                              ).image,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "ourhonorableguest".tr,
                  style: getBoldStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Guest@gmail.com",
                  style: getRegularStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 5.h,
                ),

                SizedBox(
                  height: 40.h,
                ),
                //معلومات الشخصية
                ProfileSection(
                    label: "personalDetails".tr,
                    myColor: ColorManager.gray,
                    haveArrow: false,
                    icon: IconAssets.user,
                    onTap: () {
                      //   Get.toNamed(RouteHelper.personalData);
                    }),

                //الطلبات والشكاوي
                ProfileSection(
                    label: "requestsAndComplaints".tr,
                    myColor: ColorManager.gray,
                    haveArrow: false,
                    icon: IconAssets.paper,
                    onTap: () {
                      //  Get.toNamed(RouteHelper.requestsAndComplaints);
                    }),

                //مواعيد التدريب

                ProfileSection(
                    label: "classTime".tr,
                    myColor: ColorManager.gray,
                    haveArrow: false,
                    icon: IconAssets.calendar,
                    onTap: () {
                      //     Get.toNamed(RouteHelper.classTime);
                    }),

                //التقيمات

                ProfileSection(
                    label: "rating".tr,
                    myColor: ColorManager.gray,
                    haveArrow: false,
                    icon: IconAssets.stars,
                    onTap: () {
                      //  Get.toNamed(RouteHelper.ratings);
                    }),
                //العروض
                ProfileSection(
                    label: "offer".tr,
                    haveArrow: true,
                    icon: IconAssets.localoffer,
                    onTap: () {
                      Get.toNamed(RouteHelper.guestOffers);
                    }),

                //اللغة
                ProfileSection(
                    label: "language".tr,
                    haveArrow: true,
                    icon: IconAssets.language,
                    onTap: () {
                      Get.toNamed(RouteHelper.language);
                    }),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'ourhonorableguest'.tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text('YouMustlogin2'.tr),
                SizedBox(
                  height: 10.h,
                ),
                CustomButtonPrimary(
                    text: 'login'.tr,
                    onpressed: () {
                      Get.offAndToNamed(RouteHelper.login);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      // File imageFile = File(pickedFile.path);
      final imageTemp = File(pickedFile.path);
      setState(() => this.imageFile = imageTemp);
    }
  }

  Future _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      // File imageFile = File(pickedFile.path);
      final imageTemp = File(pickedFile.path);
      setState(() => this.imageFile = imageTemp);
    }
  }

  Widget bottomSheet() {
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
          ElevatedButton(
            onPressed: () {
              setState(() {
                _getFromCamera();
                Navigator.pop(context);
              });
            },
            child: Text('openCamera'.tr),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 5),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Text('or'.tr),
          SizedBox(
            height: 7.h,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _getFromGallery();
                Navigator.pop(context);
              });
            },
            child: Text('openGallery'.tr),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              padding: EdgeInsets.symmetric(horizontal: 95, vertical: 5),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _logoutDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    IconAssets.alert,
                    color: Colors.red,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('logoutPopUpText'.tr),
              ],
            ),
          ),
          actions: <Widget>[
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.login);
                  },
                  child: Container(
                    width: 100.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red)),
                    child: Center(
                        child: Text(
                      'yes'.tr,
                      style: getBoldStyle(color: Colors.white),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 100.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Colors.red)),
                    child: Center(
                        child: Text(
                      'cancel'.tr,
                      textAlign: TextAlign.center,
                      style: getBoldStyle(
                        color: Colors.red,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteAccountDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                IconAssets.alert,
                color: Colors.red,
              ),
              // GestureDetector(
              //     onTap: () {
              //       Navigator.of(context).pop();
              //     },
              //     child: Icon(
              //       Icons.cancel,
              //       color: Colors.red,
              //     ))
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('deleteAccountTextTitle'.tr),
              ],
            ),
          ),
          actions: <Widget>[
            Column(
              children: [
                Text('deleteAccountTextBody'.tr),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 100.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.red)),
                        child: Center(
                            child: Text(
                          'yes'.tr,
                          style: getBoldStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 100.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.red)),
                        child: Center(
                            child: Text(
                          'cancel'.tr,
                          textAlign: TextAlign.center,
                          style: getBoldStyle(
                            color: Colors.red,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
