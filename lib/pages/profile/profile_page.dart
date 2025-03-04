// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/data/api/apiconst.dart';
import 'package:future_heroes_customer/pages/qr_code/qr_code.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/services/app_provider.dart';
import 'package:future_heroes_customer/widgets/profile_section.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/api/dio_client.dart';
import '../../resources/assets_manager.dart';
import '../../resources/styles_manager.dart';
import '../auth/login/login.dart';
import '../home/NoConnection.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      Future<void> _logoutDialog() async {
        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
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
                      onTap: () async {

                        final prefs = await SharedPreferences.getInstance();
                        await prefs.clear();
                        await provider.logOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Login()),
                            (Route<dynamic> route) => false);
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
          barrierDismissible: false,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      IconAssets.alert,
                      color: Colors.red,
                    ),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min, // Added to minimize content height
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0), // Added padding for vertical spacing
                      child: Center(child: Text('deleteAccountTextTitle'.tr)),
                    ),
                    Text('deleteAccountTextBody'.tr),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () async {


                            await DioClient.dioClient.deleteAccount();
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.clear();
                            await provider.logOut();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Login(),
                              ),
                                  (Route<dynamic> route) => false,
                            );
                          },
                          child: Container(
                            width: 100.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.red),
                            ),
                            child: Center(
                              child: Text(
                                'yes'.tr,
                                style: getBoldStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            width: 100.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.red),
                            ),
                            child: Center(
                              child: Text(
                                'cancel'.tr,
                                textAlign: TextAlign.center,
                                style: getBoldStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }




      return Scaffold(
        body: OfflineBuilder(
          child: provider.profileData == null
              ? Center(
                  child: Text(
                  "No Data",
                  style: getRegularStyle(
                      color: ColorManager.primary, fontSize: 14.sp),
                ))
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60.h,
                        ),
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
                                        : NetworkImage(ApiConstant.imageURL +
                                            provider.profileData!.imageString!),
                                backgroundImage:
                                    provider.profileData!.imageString == null
                                        ? Image.asset(
                                            ImageAssets.avatar,
                                          ).image
                                        : NetworkImage(ApiConstant.imageURL +
                                            provider.profileData!.imageString!),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          provider.profileData!.fullName!,
                          style: getBoldStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "membershipNumber".tr,
                              style: getRegularStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              "${provider.profileData!.membershipNo ?? 0}",
                              style: getBoldStyle(color: ColorManager.primary),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "playerLevel".tr,
                              style: getRegularStyle(color: ColorManager.black),
                            ),
                            Text(
                              "Beginner".tr,
                              style: getBoldStyle(
                                  color: ColorManager.primary, fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        //معلومات الشخصية
                        ProfileSection(
                            label: "personalDetails".tr,
                            haveArrow: true,
                            icon: IconAssets.user,
                            onTap: () {
                              provider.getProfileData();

                              Get.toNamed(RouteHelper.personalData);
                            }),
                        SizedBox(
                          height: 10.h,
                        ),
                        //الطلبات والشكاوي
                        ProfileSection(
                            label: "requestsAndComplaints".tr,
                            haveArrow: true,
                            icon: IconAssets.paper,
                            onTap: () {
                              provider.getComplaintReplay();
                              provider.getOrderReplay();
                              Get.toNamed(RouteHelper.requestsAndComplaints);
                            }),

                        //مواعيد التدريب
                        SizedBox(
                          height: 10.h,
                        ),
                        ProfileSection(
                            label: "classTime".tr,
                            haveArrow: true,
                            icon: IconAssets.calendar,
                            onTap: () {
                              Get.toNamed(RouteHelper.classTime);
                            }),
                        SizedBox(
                          height: 10.h,
                        ),
                        //ترقية الاشتراك
                        ProfileSection(
                            label: "subscriptionUpgrade".tr,
                            haveArrow: true,
                            icon: IconAssets.jewelry,
                            onTap: () {
                              Get.toNamed(RouteHelper.subscriptionUpgrade);
                            }),
                        SizedBox(
                          height: 10.h,
                        ),
                        //التقيمات

                        ProfileSection(
                            label: "rating".tr,
                            haveArrow: true,
                            icon: IconAssets.stars,
                            onTap: () {
                              Get.toNamed(RouteHelper.ratings);
                            }),
                        SizedBox(
                          height: 10.h,
                        ),
                        //اللغة
                        ProfileSection(
                            label: "language".tr,
                            haveArrow: true,
                            icon: IconAssets.language,
                            onTap: () {
                              Get.toNamed(RouteHelper.language);
                            }),
                        SizedBox(
                          height: 10.h,
                        ),
                        //تسجيل الخروج
                        ProfileSection(
                            label: "logout".tr,
                            haveArrow: false,
                            icon: IconAssets.user,
                            myColor: Colors.red,
                            onTap: () {
                              _logoutDialog();
                            }),
                        SizedBox(
                          height: 10.h,
                        ),
                        //حذف الحساب
                        ProfileSection(
                            label: "deleteAccount".tr,
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
          connectivityBuilder:
              (BuildContext context, List<ConnectivityResult> connectivity, Widget child) {
            final bool connected = connectivity.contains(ConnectivityResult.mobile) ||
                connectivity.contains(ConnectivityResult.wifi);
            return connected ? child : NoConnectionScreen();
          },
        ),
      );
    });
  }

}
