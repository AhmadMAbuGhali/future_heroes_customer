import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../widgets/CustomButtonPrimary.dart';
import '../../widgets/snakbar.dart';

class GuestOffers extends StatefulWidget {
  const GuestOffers({Key? key}) : super(key: key);

  @override
  State<GuestOffers> createState() => _GuestOffersState();
}

class _GuestOffersState extends State<GuestOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 45.h,
                // left: 20.w,
                // right: 20.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
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
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Text(
                  "offer".tr,
                  style: getBoldStyle(color: ColorManager.black),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            ExpandablePanel(
                                header: Row(
                                  children: [
                                    CircleAvatar(
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
                                          IconAssets.notifications,
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
                                      "offerTitle".tr,
                                      style: getBoldStyle(
                                          color: ColorManager.black,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                collapsed: Text(
                                  "offerBody".tr,
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                expanded: Column(
                                  children: [
                                    Text("offerBody".tr),
                                  ],
                                )),
                            SizedBox(
                              height: 10.h,
                            ),
                            Divider(
                              thickness: 2,
                              endIndent: 3,
                              height: 2,
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
