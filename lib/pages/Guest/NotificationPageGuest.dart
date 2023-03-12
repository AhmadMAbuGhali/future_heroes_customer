import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:future_heroes_customer/widgets/guestWidget.dart';
import 'package:get/get.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class NotificationPageGuest extends StatefulWidget {
  const NotificationPageGuest({Key? key}) : super(key: key);

  @override
  State<NotificationPageGuest> createState() => _NotificationPageGuestState();
}

class _NotificationPageGuestState extends State<NotificationPageGuest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Row(
              children: [
                Text(
                  "notification".tr,
                  style: getBoldStyle(color: ColorManager.black),
                ),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "markAsRead".tr,
                      style: getBoldStyle(
                          color: ColorManager.primary, fontSize: 12),
                    ))
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
            Column(
              children: [
                GuestWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
