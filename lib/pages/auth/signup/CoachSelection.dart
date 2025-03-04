import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/data/api/apiconst.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../resources/styles_manager.dart';
import '../../../routes/route_helper.dart';
import '../../../services/auth_provider.dart';
import '../../home/NoConnection.dart';

class CoachSelection extends StatelessWidget {
  CoachSelection({super.key});



  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: OfflineBuilder(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding:  EdgeInsets.only(top: 40.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'choseCoach'.tr,
                    style: getBoldStyle(color: ColorManager.black),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "choseFavCoach".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: ColorManager.gray),
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.coachFromId.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 20.h),
                            // height: 350,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "lecture".tr  + provider.coachFromId[index].subCategoryName!,
                                  style:
                                      getBoldStyle(color: ColorManager.primary),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                SizedBox(
                                  height: 190,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: provider
                                          .coachFromId[index].coaches?.length,
                                      itemBuilder: (context, index2) {
                                        return InkWell(
                                            onTap: () async {
                                              // provider.makeCoachSelectionFalse();

                                              await provider.getTimeList(
                                                  provider
                                                          .coachFromId[index]
                                                          .coaches![index2]
                                                          .email ??
                                                      '',provider.categorySub[index].id!);
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Column(
                                                children: [
                                                  provider
                                                          .coachFromId[index]
                                                          .coaches![index2]
                                                          .imageString!
                                                          .isEmpty
                                                      ? CircleAvatar(
                                                          backgroundImage:
                                                              Image.asset(
                                                                      ImageAssets
                                                                          .avatar)
                                                                  .image,
                                                          radius: 50,
                                                        )
                                                      : CircleAvatar(
                                                          backgroundImage:
                                                              Image.network(
                                                            '${ApiConstant.imageURL}${provider.coachFromId[index].coaches?[index2].imageString ?? ''}',
                                                            height: 100,
                                                            width: 100,
                                                          ).image,
                                                          radius: 50,
                                                        ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Text(
                                                    provider
                                                            .coachFromId[index]
                                                            .coaches?[index2]
                                                            .fullName ??
                                                        'مستخدم',
                                                    style: getRegularStyle(
                                                        color: ColorManager
                                                            .primary),
                                                  ),
                                                ],
                                              ),
                                            ));
                                      }),
                                ),
                                Text(
                                  'availableTime'.tr,
                                  style:
                                      getMediumStyle(color: ColorManager.black),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                DropdownButtonFormField2(
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                  isExpanded: true,
                                  key: Key('$index'),
                                  dropdownStyleData: DropdownStyleData(
                                    maxHeight: 200.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                  buttonStyleData: ButtonStyleData(
                                    height: 60.h,
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                  ),
                                  menuItemStyleData: MenuItemStyleData(
                                    height: 50.h,
                                  ),
                                  items: provider.timeListMap[provider.categorySub[index].id]
                                      ?.where((element) => element.subCategoryId == provider.coachFromId[index].subCategoryId)
                                      .map((item) => DropdownMenuItem<String>(
                                    value: provider.maptimeListString[item.id!] ?? "اختر الحصة",
                                    child: Text(
                                      provider.maptimeListString[item.id!]!,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ))
                                      .toList() ??
                                      [],
                                  onChanged: (value) {
                                    var key = provider.maptimeListString.keys.firstWhere(
                                            (k) => provider.maptimeListString[k] == value,
                                        orElse: () => 0);

                                    provider.classId.remove(key);
                                    provider.classId.add(key);
                                  },
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  CustomButtonPrimary(
                    text: 'continue'.tr,
                    onpressed: () {

                      Get.offNamed(RouteHelper.diseases);
                      Get.delete(force: true);
                    },
                  ),
                ],
              ),
            ),
          ),
          connectivityBuilder:
              (BuildContext context, List<ConnectivityResult> connectivity, Widget child) {
            final bool connected = connectivity.contains(ConnectivityResult.mobile) ||
                connectivity.contains(ConnectivityResult.wifi);
            return connected ? child : NoConnectionScreen();
          },
        ),
      );
    });
  }
}
