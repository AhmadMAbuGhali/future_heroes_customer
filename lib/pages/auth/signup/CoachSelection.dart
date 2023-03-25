import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/data/api/apiconst.dart';
import 'package:future_heroes_customer/models/time_list.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/widgets/CardWidget.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/CardCheckBoxWidget.dart';
import 'package:future_heroes_customer/widgets/snakbar.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../../resources/styles_manager.dart';
import '../../../routes/route_helper.dart';
import '../../../services/auth_provider.dart';

class CoachSelection extends StatelessWidget {
  CoachSelection({super.key});

  List<int> classId = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                                "الحصة : " + provider.categorySub[index].name!,
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
                                      return Container(
                                        child: InkWell(
                                            onTap: () async {
                                              // provider.makeCoachSelectionFalse();

                                              await provider.getTimeList(
                                                  provider
                                                          .coachFromId[index]
                                                          .coaches![index2]
                                                          .email ??
                                                      '');
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
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
                                            )),
                                      );
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
                                key: UniqueKey(),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: ColorManager.primary,
                                ),
                                iconSize: 30.sp,
                                buttonHeight: 50.h,
                                buttonPadding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                items: provider.listTime
                                    .where((element) =>
                                        element.subCategoryId ==
                                        provider
                                            .coachFromId[index].subCategoryId)
                                    .map((item) => DropdownMenuItem<String>(
                                          value: provider.maptimeListString[
                                                  item.id!] ??
                                              "احتر الحصة",
                                          child: Text(
                                            provider
                                                .maptimeListString[item.id!]!,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                // validator: (value) {
                                //   if (value == null) {
                                //     return 'يجب تحديد تصنيف المهمة';
                                //   }
                                //   return null;
                                // },
                                onChanged: (value) {
                                  var key = provider.maptimeListString.keys
                                      .firstWhere(
                                          (k) =>
                                              provider.maptimeListString[k] ==
                                              value,
                                          orElse: () => 0);
                                  print(key);
                                  classId.remove(key);
                                  classId.add(key);

                                  // TaskCategoryItem? h2 = value as TaskCategoryItem?;
                                  // provider.selectedCategoryId = h2!.id!;
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
                    provider.sendClassTime(classId);
                    Get.toNamed(RouteHelper.diseases);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
