import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/main.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/dateWidget.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/resources/styles_manager.dart';
import 'package:future_heroes_customer/widgets/CardCheckBoxWidget.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/class_time_widget.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../services/auth_provider.dart';
import '../../services/shared_preference_helper.dart';

class HomeScreen extends StatelessWidget {

   HomeScreen({Key? key}) : super(key: key);

  var numberOfDone = 3;

  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: getIt<SharedPreferenceHelper>().getActiveStat()==true?Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(ImageAssets.mainImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Image.asset(
                    ImageAssets.avatar,
                    width: 100,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "homeTopText1".tr,
                    style: getRegularStyle(color: ColorManager.white),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("numberOfPostponement".tr + " ${numberOfDone}",
                      style: getRegularStyle(color: ColorManager.white)),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Divider(
                        thickness: 1,
                        color: ColorManager.white,
                        endIndent: 1,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text("homeTopText2".tr,
                              style: getRegularStyle(
                                  color: ColorManager.white, fontSize: 11)),
                          Text("homeTopText3".tr,
                              style: getRegularStyle(
                                  color: ColorManager.white, fontSize: 11)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   top: 250.h,
          //   left: 20,
          //   right: 20,
          //   child: ClassTimeWidget(),
          // ),
          Positioned(
              top: 300.h,
              left: 20,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    DateWidget(
                      time: DateTime.now(),
                      date: DateTime.now(),
                      name: 'يوسف الجزار',
                      duration: 60,
                      type: 'تايكواندو',
                      onTap: () {},
                    ),
                    DateWidget(
                      time: DateTime.now(),
                      date: DateTime.now(),
                      name: 'يوسف الجزار',
                      duration: 60,
                      type: 'تايكواندو',
                      onTap: () {},
                    ),
                  ],
                ),
              )),
        ],
      ):Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(ImageAssets.mainImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Image.asset(
                    ImageAssets.avatar,
                    width: 100,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "homeTopText1".tr,
                    style: getRegularStyle(color: ColorManager.white),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text("numberOfPostponement".tr + " ${numberOfDone}",
                      style: getRegularStyle(color: ColorManager.white)),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Divider(
                        thickness: 1,
                        color: ColorManager.white,
                        endIndent: 1,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text("homeTopText2".tr,
                              style: getRegularStyle(
                                  color: ColorManager.white, fontSize: 11)),
                          Text("homeTopText3".tr,
                              style: getRegularStyle(
                                  color: ColorManager.white, fontSize: 11)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   top: 250.h,
          //   left: 20,
          //   right: 20,
          //   child: ClassTimeWidget(),
          // ),
          Positioned(
              top: 300.h,
              left: 20,
              right: 20,
              child: Center(
                child: Column(children: [
                  Image.asset(ImageAssets.mustReg,width: 300,height: 300,),
                  Text("عليك اكمال عملية التسجيل  لتتمكن من عرض الصفحة الحالية",textAlign: TextAlign.center,),

                  CustomButtonPrimary(text: 'اكمال التسجيل', onpressed: () {
                    Get.toNamed(RouteHelper.signUpPart2);
                  },)
                ],),
              )
          ),
        ],
      ),
    );
  });}
}
