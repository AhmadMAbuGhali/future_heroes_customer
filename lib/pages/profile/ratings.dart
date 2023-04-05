import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:future_heroes_customer/services/app_provider.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../home/NoConnection.dart';

class Ratings extends StatelessWidget {
  const Ratings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (contxet,provider,index){
      return Scaffold(
        body: OfflineBuilder(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () async {
                                Get.back();
                                await provider.getComplaintReplay();
                                await provider.getProfileData();
                                await provider.getUserNotification();
                                await provider.getClassTime();
                                await provider.getOrderReplay();
                                await provider.getOffers();
                              },
                              icon: const Icon(
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
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextTitle(text: "rating".tr),
                  Expanded(
                      child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  ExpandablePanel(
                                    header: Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 3,
                                          backgroundColor: ColorManager.primary,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          width: 25.w,
                                          height: 25.h,
                                          decoration: BoxDecoration(
                                            color: ColorManager.jewelryBG,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: SvgPicture.asset(
                                              IconAssets.stars,
                                              width: 10.w,
                                              height: 10.h,
                                              color: ColorManager.primary,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Text(
                                          'ratingTitle'.tr,
                                          style: getBoldStyle(
                                              color: ColorManager.black),
                                        ),
                                      ],
                                    ),
                                    collapsed: Container(
                                      margin:
                                      EdgeInsets.symmetric(horizontal: 55.w),
                                      // padding:
                                      //     EdgeInsets.symmetric(horizontal: 55.w),
                                      child: Text(
                                        'ratingBodyCosplay'.tr,
                                        softWrap: true,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    expanded: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Table(
                                              border: TableBorder.all(),
                                              columnWidths:  <int,
                                                  TableColumnWidth>{
                                                0: FixedColumnWidth(140.w),
                                                1: FixedColumnWidth(90.w),
                                                2: FixedColumnWidth(90.w),
                                              },
                                              defaultVerticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                              children: <TableRow>[
                                                TableRow(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Center(child: Text("Standard".tr)),
                                                    ),
                                                    SizedBox(
                                                      height: 50,width: 50,
                                                      child: Center(child: Text("YourRating".tr)),
                                                    ),
                                                    SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Center(child: Text("HighestScore".tr)),
                                                    ),
                                                  ],
                                                ),
                                                TableRow(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Center(child: Text("ratingAttendeesTitle".tr)),
                                                    ),
                                                    const SizedBox(
                                                      height: 50,width: 50,
                                                      child: Center(child: Text("4")),
                                                    ),
                                                    const SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Center(child: Text("5")),
                                                    ),
                                                  ],
                                                ),
                                                TableRow(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Center(child: Text("ratingObligationTrainingTitle".tr)),
                                                    ),
                                                    const SizedBox(
                                                      height: 50,width: 50,
                                                      child: Center(child: Text("4")),
                                                    ),
                                                    const SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Center(child: Text("5")),
                                                    ),
                                                  ],
                                                ),
                                                TableRow(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Center(child: Text("ratingLiteratureAndEthicsTitle".tr)),
                                                    ),
                                                    const SizedBox(
                                                      height: 50,width: 50,
                                                      child: Center(child: Text("4")),
                                                    ),
                                                    const SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Center(child: Text("5")),
                                                    ),
                                                  ],
                                                ),
                                                TableRow(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Center(child: Text("ratingObligationDressTitle".tr)),
                                                    ),
                                                    const SizedBox(
                                                      height: 50,width: 50,
                                                      child: Center(child: Text("4")),
                                                    ),
                                                    const SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Center(child: Text("5")),
                                                    ),
                                                  ],
                                                ),
                                                TableRow(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Center(child: Text("Punctuality".tr)),
                                                    ),
                                                    const SizedBox(
                                                      height: 50,width: 50,
                                                      child: Center(child: Text("4")),
                                                    ),
                                                    const SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Center(child: Text("5")),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                        SizedBox(height: 10.h,),


                                        Text(
                                          "coachNoteTitle".tr,
                                          textAlign: TextAlign.start,
                                          style: getRegularStyle(
                                              color: ColorManager.primary),
                                        ),
                                        Text(
                                          'coachNoteBody'.tr,
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(height: 10.h,),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 2,
                                    endIndent: 3,
                                    height: 2,
                                  ),


                                ],
                              ),
                            );
                          }))
                ],
              ),
            ),
          ),
          connectivityBuilder:
              (BuildContext context, ConnectivityResult connectivity, Widget child) {

            final bool connected = connectivity != ConnectivityResult.none;
            return connected?child:NoConnectionScreen();


          },
        ),
      );
    });

  }
}
