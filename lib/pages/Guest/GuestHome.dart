import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/LogoAuth.dart';
import 'package:future_heroes_customer/widgets/dateWidget.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/resources/styles_manager.dart';
import 'package:future_heroes_customer/widgets/CardCheckBoxWidget.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/class_time_widget.dart';
import 'package:future_heroes_customer/widgets/guestWidget.dart';
import 'package:get/get.dart';

class GuestHome extends StatefulWidget {
  const GuestHome({Key? key}) : super(key: key);

  @override
  State<GuestHome> createState() => _GuestHomeState();
}

class _GuestHomeState extends State<GuestHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Stack(
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
                    "Welcomeourhonorableguest".tr,
                    style: getRegularStyle(color: ColorManager.white),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
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
                          Text("GuestTopText1".tr,
                              style: getRegularStyle(
                                  color: ColorManager.white, fontSize: 11)),
                          Text("GuestTopText2".tr,
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
          Positioned(
              top: 300.h,
              left: 20,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GuestWidget(),
              )),
        ],
      ),
    );
  }
}
