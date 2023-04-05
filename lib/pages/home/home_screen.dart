import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/main.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/resources/styles_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/services/app_provider.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/dateWidget.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../data/api/apiconst.dart';
import '../../services/shared_preference_helper.dart';
import 'NoConnection.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var numberOfDone = 3;

  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {

    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: getIt<SharedPreferenceHelper>().getActiveStat() == true
            ? OfflineBuilder(
              child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 270.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImageAssets.mainImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60.h,
                            ),
                            CircleAvatar(
                              radius: 50.r,
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
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "homeTopText1".tr +
                                      provider.profileData!.fullName!,
                              style: getRegularStyle(color: ColorManager.white),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                                "${"numberOfPostponement".tr} ${provider.profileData!.remainingPostponements!}",
                                style:
                                    getRegularStyle(color: ColorManager.white)),
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
                                    Center(
                                      child: Text(
                                          "${"homeTopText3".tr} ${provider.profileData!.endDate!.split("T").first}",
                                          style: getRegularStyle(
                                              color: ColorManager.white,
                                              fontSize: 11)),
                                    ),
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
                        top: 240.h,
                        left: 20.w,
                        right: 20.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.h),
                          child: RefreshIndicator(
                            onRefresh: () async {
                              await    provider.getProfileData();
                              await  provider.getClassTime();
                            },
                            child: SizedBox(
                              height: 490.h,
                              child: ListView.builder(
                                  itemCount: provider.classTime.length,
                                  itemBuilder: (context, index) {
                                    return DateWidget(
                                      timeStart:
                                          provider.classTime[index].startTime,
                                      timeEnd: provider.classTime[index].endTime,
                                      date: shaedpref.getString("curruntLang") ==
                                              "ar"
                                          ? "${provider
                                              .daysAr[provider.classTime[index].day]!}  : ${provider.classTime[index].classEnd!
                                              .split("T")
                                              .first}"
                                          : "${provider.daysEn[
                                                  provider.classTime[index].day]!}  : ${provider.classTime[index].classEnd!
                                                  .split("T")
                                                  .first}",
                                      name: provider.classTime[index].classLecture!
                                          .coachName,
                                      duration: provider.classTime[index].duration,
                                      type: provider
                                          .classTime[index].classLecture!.name,
                                      onTap: () {
                                        provider.setPostponeId(
                                            provider.classTime[index].id!);
                                        Get.toNamed(
                                            RouteHelper.postponeAnAppointment);
                                      },
                                    );
                                  }),
                            ),
                          ),
                        )),
                  ],
                ),
          connectivityBuilder:
              (BuildContext context, ConnectivityResult connectivity, Widget child) {

            final bool connected = connectivity != ConnectivityResult.none;
            return connected?child:NoConnectionScreen();


          },
            )
            : getIt<SharedPreferenceHelper>().getWaitingStat() == true
                ? OfflineBuilder(
                  child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 270.h,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(ImageAssets.mainImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 80.h,
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
                                  style:
                                      getRegularStyle(color: ColorManager.white),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),

                              ],
                            ),
                          ),
                        ),
                        RefreshIndicator(
                          onRefresh: () async {
                            await provider.checkIsActive();
                            await    provider.getProfileData();
                            await  provider.getClassTime();
                          },
                          child: Stack(
                            children: [
                              Positioned.fill(
                                  top: 300.h,
                                  left: 20,
                                  right: 20,
                                  child: SingleChildScrollView(
                                    physics: const AlwaysScrollableScrollPhysics(),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            ImageAssets.mustReg,
                                            width: 300,
                                            height: 300,
                                          ),
                                          Text(
                                            "WaitingApproval".tr,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
          connectivityBuilder:
              (BuildContext context, ConnectivityResult connectivity, Widget child) {

            final bool connected = connectivity != ConnectivityResult.none;
            return connected?child:NoConnectionScreen();


          },
                )
                : OfflineBuilder(
                  child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 300,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(ImageAssets.mainImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 80.h,
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
                                  style:
                                      getRegularStyle(color: ColorManager.white),
                                ),
                                SizedBox(
                                  height: 5.h,
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
                            top: 260.h,
                            left: 20.w,
                            right: 20.w,
                            child: Center(
                              child: Column(
                                children: [
                                  Image.asset(
                                    ImageAssets.mustReg,
                                    width: 300.w,
                                    height: 300.h,
                                  ),
                                  Text(
                                    "CompleteRegistration".tr,
                                    textAlign: TextAlign.center,
                                  ),
                                  CustomButtonPrimary(
                                    text: 'CompleteReg'.tr,
                                    onpressed: () {
                                      Get.toNamed(RouteHelper.signUpPart2);
                                    },
                                  )
                                ],
                              ),
                            )),
                      ],
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
