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

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (builder) => bottomSheet(),
                          );

                          // setState(() {
                          //   _getFromGallery();
                          // });
                        },
                        child: Center(
                          child: CircleAvatar(
                            radius: 60,
                            foregroundImage: imageFile == null
                                ? Image.asset(
                                    ImageAssets.logopng,
                                  ).image
                                : Image.file(
                                    imageFile!,
                                    fit: BoxFit.cover,
                                  ).image,
                            backgroundImage: imageFile == null
                                ? Image.asset(
                                    ImageAssets.logopng,
                                  ).image
                                : Image.file(
                                    imageFile!,
                                    fit: BoxFit.cover,
                                  ).image,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "يوسف الجزار ",
                    style: getBoldStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Yousef.n.aljazzar@gmail.com",
                    style: getRegularStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  //معلومات الشخصية
                  ProfileSection(
                      label: "المعلومات الشخصية",
                      haveArrow: true,
                      icon: IconAssets.user,
                      onTap: () {
                        Get.toNamed(RouteHelper.personalData);
                      }),

                  //الطلبات والشكاوي
                  ProfileSection(
                      label: "الطلبات والشكاوي",
                      haveArrow: true,
                      icon: IconAssets.paper,
                      onTap: () {
                        Get.toNamed(RouteHelper.requestsAndComplaints);
                      }),

                  //مواعيد التدريب

                  ProfileSection(
                      label: "مواعيد التدريب",
                      haveArrow: true,
                      icon: IconAssets.calendar,
                      onTap: () {
                        Get.toNamed(RouteHelper.classTime);
                      }),

                  //ترقية الاشتراك
                  ProfileSection(
                      label: "ترقية الاشتراك",
                      haveArrow: true,
                      icon: IconAssets.jewelry,
                      onTap: () {
                        Get.toNamed(RouteHelper.subscriptionUpgrade);
                      }),

                  //التقيمات

                  ProfileSection(
                      label: "التقيمات",
                      haveArrow: true,
                      icon: IconAssets.stars,
                      onTap: () {
                        Get.toNamed(RouteHelper.ratings);
                      }),

                  //تسجيل الخروج
                  ProfileSection(
                      label: "تسجيل الخروج",
                      haveArrow: false,
                      icon: IconAssets.user,
                      myColor: Colors.red,
                      onTap: () {
                        _logoutDialog();
                      }),

                  //حذف الحساب
                  ProfileSection(
                      label: "حذف حسابي",
                      haveArrow: false,
                      icon: IconAssets.delete,
                      myColor: Colors.red,
                      onTap: () {
                        _deleteAccountDialog();
                      }),
                ],
              ),
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
      height: 180.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'تغيير الصورة الشخصية',
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
            child: Text("فتح الكاميرا"),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              padding: EdgeInsets.symmetric(horizontal: 130, vertical: 5),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Text("أو"),
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
            child: Text("قم بالاختيار من المعرض"),
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30.w,
              ),
              SvgPicture.asset(
                IconAssets.alert,
                color: Colors.red,
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('هل انت متأكد من تسجيل الحروج'),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.login);
                  },
                  child: Container(
                    width: 80.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red)),
                    child: Center(
                        child: Text(
                      'نعم ',
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
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red)),
                    child: Center(
                        child: Text(
                      'إلغاء الأمر ',
                      textAlign: TextAlign.center,
                      style: getBoldStyle(
                        color: Colors.white,
                      ),
                    )),
                  ),
                ),
              ],
            )
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30.w,
              ),
              SvgPicture.asset(
                IconAssets.alert,
                color: Colors.red,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ))
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('هل انت متأكد من حذف الحساب'),
              ],
            ),
          ),
          actions: <Widget>[
            Column(
              children: [
                Text(
                    "هل انت واثق انك تريد حذف الحساب  عند حذف الحساب  ستفقد جميع البيانات الخاصة بك "),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 80.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.red)),
                        child: Center(
                            child: Text(
                          'نعم ',
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
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.red)),
                        child: Center(
                            child: Text(
                          'إلغاء الأمر ',
                          textAlign: TextAlign.center,
                          style: getBoldStyle(
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
