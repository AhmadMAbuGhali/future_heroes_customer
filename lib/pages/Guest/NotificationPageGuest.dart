import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/widgets/guestWidget.dart';
import 'package:get/get.dart';

import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../home/NoConnection.dart';

class NotificationPageGuest extends StatefulWidget {
  const NotificationPageGuest({Key? key}) : super(key: key);

  @override
  State<NotificationPageGuest> createState() => _NotificationPageGuestState();
}

class _NotificationPageGuestState extends State<NotificationPageGuest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OfflineBuilder(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      "notification".tr,
                      style: getBoldStyle(color: ColorManager.black),
                    ),
                    const Spacer(),
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
        ),
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          final bool connected = connectivity != ConnectivityResult.none;
          return connected ? child : NoConnectionScreen();
        },
      ),
    );
  }
}
