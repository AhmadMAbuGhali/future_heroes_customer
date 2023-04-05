import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/resources/styles_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/custom_complaints.dart';
import 'package:future_heroes_customer/widgets/custom_request.dart';
import 'package:get/get.dart';

import '../home/NoConnection.dart';

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
      body: OfflineBuilder(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding:  EdgeInsets.only(top: 40.h),
            child: Column(children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: ColorManager.primary,
                          )),
                      Text(
                        'user'.tr,
                        style: getBoldStyle(color: ColorManager.primary),
                      ),
                    ],
                  )
                ],
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
                          contentPadding: EdgeInsets.only(
                              top: 6.h, bottom: 10.h, left: 17.w, right: 18.w),
                          height: 45.h,
                          backgroundColor: ColorManager.primary,
                          unselectedBackgroundColor: Colors.white,
                          unselectedLabelStyle:
                              getBoldStyle(color: Colors.black, fontSize: 12),
                          borderWidth: 1,
                          borderColor: ColorManager.primary,
                          labelStyle:
                              getBoldStyle(color: ColorManager.white, fontSize: 12),
                          tabs: [
                            Tab(
                              text: "complaints".tr,
                              height: 70.h,
                            ),
                            Tab(
                              text: 'requests'.tr,
                              height: 70.h,
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: <Widget>[
                              Center(
                                  child: Column(children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * 0.6,
                                    child: const CustomComplaints()),
                                CustomButtonPrimary(
                                    text: "sendComplaint".tr,
                                    onpressed: () {
                                      Get.toNamed(RouteHelper.sendComplaints);
                                    }),
                              ])),
                              Center(
                                  child: Column(children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * 0.6,
                                    child: const CustomRequest()),
                                CustomButtonPrimary(
                                    text: 'sendRequest'.tr,
                                    onpressed: () {
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
          ),
        ),
        connectivityBuilder:
            (BuildContext context, ConnectivityResult connectivity, Widget child) {

          final bool connected = connectivity != ConnectivityResult.none;
          return connected?child:NoConnectionScreen();


        },
      ),
    );
  }
}
