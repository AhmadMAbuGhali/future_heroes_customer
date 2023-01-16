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

        body: Center(
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
                    label:   "مواعيد التدريب",
                    haveArrow: true,
                    icon: IconAssets.calendar,
                    onTap: () {}),

                //ترقية الاشتراك
                ProfileSection(
                    label:   "ترقية الاشتراك",
                    haveArrow: true,
                    icon: IconAssets.jewelry,
                    onTap: () {}),

                //العروض
                ProfileSection(
                    label:    "العروض",
                    haveArrow: true,
                    icon: IconAssets.localoffer,
                    onTap: () {}),

                //التقيمات

                ProfileSection(
                    label:  "التقيمات",
                    haveArrow: true,
                    icon: IconAssets.stars,
                    onTap: () {}),

                //تسجيل الخروج
                ProfileSection(
                    label:  "تسجيل الخروج",
                    haveArrow: false,
                    icon: IconAssets.user,
                    myColor: Colors.red,
                    onTap: () {}),

                //حذف الحساب
                ProfileSection(
                    label:  "حذف حسابي",
                    haveArrow: false,
                    icon: IconAssets.delete,
                    myColor: Colors.red,
                    onTap: () {}),

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
}
