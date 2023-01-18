import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/resources/styles_manager.dart';
import 'package:future_heroes_customer/widgets/class_time_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var numberOfDone = 3;

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
                    height: 60.h,
                  ),
                  Image.asset(
                    ImageAssets.avatar,
                    width: 100,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "مساء الخير  , يوسف نعمان الجزار",
                    style: getRegularStyle(color: ColorManager.white),
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
                          Text("موعد التدريب القادم : غداً , الساعة 10 صباحاً",
                              style: getRegularStyle(
                                  color: ColorManager.white, fontSize: 11)),
                          Text("موعد تجديد اشتراكك الحالي : 01/02/2023 مً",
                              style: getRegularStyle(
                                  color: ColorManager.white, fontSize: 11)),
                        ],
                      ),
                      Column(
                        children: [
                          Text("عدد التأجيلات المتبقية : ${numberOfDone}",
                              style:
                                  getRegularStyle(color: ColorManager.white)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 250.h,
            left: 20,
            right: 20,
            child: ClassTimeWidget(),
          ),
        ],
      ),
    );
  }
}
