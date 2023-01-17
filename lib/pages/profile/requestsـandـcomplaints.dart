import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/pages/navbar/main_navbar.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/resources/styles_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/custom_complaints.dart';
import 'package:future_heroes_customer/widgets/custom_request.dart';
import 'package:get/get.dart';

class RequestsAndComplaints extends StatefulWidget {
  const RequestsAndComplaints({Key? key}) : super(key: key);

  @override
  State<RequestsAndComplaints> createState() => _RequestsAndComplaintsState();
}

class _RequestsAndComplaintsState extends State<RequestsAndComplaints>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  List<Color>? tabBackground;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabBackground = [Colors.blue, Colors.pink, Colors.cyan];
    tabController?.addListener(() {
      if (tabController!.indexIsChanging) {
        setState(() {
          tabBackground![tabController!.index] = ColorManager.primary;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          padding: EdgeInsets.only(
            top: 45.h,
            left: 20.w,
            right: 20.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    "المستخدم",
                    style: getBoldStyle(color: ColorManager.primary),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: ColorManager.primary,
                      )),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  ButtonsTabBar(
                    buttonMargin: const EdgeInsets.symmetric(horizontal: 10),
                    contentPadding: const EdgeInsets.only(
                        top: 5, bottom: 10, left: 18, right: 18),
                    height: 40.h,
                    backgroundColor: ColorManager.primary,
                    unselectedBackgroundColor: Colors.white,
                    unselectedLabelStyle: getBoldStyle(color: Colors.black),
                    borderWidth: 1,
                    borderColor: ColorManager.primary,
                    labelStyle:
                        getBoldStyle(color: ColorManager.white, fontSize: 18),
                    tabs: [
                      Tab(
                        text: "الشكاوي ",
                        height: 70,
                      ),
                      Tab(
                        text: "الطلبات ",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        Center(
                            child: Column(
                                children: [
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Container(
                                        height: MediaQuery.of(context).size.height*0.7,
                                        child: CustomComplaints()),
                                  ),
                                  CustomButtonPrimary(text: "ارسال شكوى ", onpressed: (){
                                    Get.toNamed(RouteHelper.sendComplaints);
                                  }),


                                ])),
                        Center(
                            child: Column(
                                children: [
                                  Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Container(
                                        height: MediaQuery.of(context).size.height*0.7,
                                          child: CustomRequest()),
                                    ),
                                  CustomButtonPrimary(text: "ارسال طلب جديد", onpressed: (){
                                    Get.toNamed(RouteHelper.sendRequests);
                                  }),

                        ])),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
