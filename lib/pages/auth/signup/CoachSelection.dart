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

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              children: [

                CustomTextTitle(
                  text: 'choseCoach'.tr,
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
                      itemBuilder: (context,index){
                    return    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:provider.coachFromId[index].coaches?.length ,
                                itemBuilder:(context,index2){
                                  return  Container(
                                    decoration: BoxDecoration(
                                        border: provider.isCoachSelection
                                            ? null
                                            : Border.all(
                                          color: ColorManager.primary,
                                          width: 2,
                                        )),
                                    child: InkWell(
                                        onTap: () {
                                          // provider.makeCoachSelectionFalse();
                                         provider.getTimeList(provider.coachFromId[index].coaches![index2].email ??'') ;
                                        },
                                        child: Column(
                                          children: [
                                            provider.coachFromId[index].coaches![index2].imageString!.isEmpty?Image.asset(ImageAssets.avatar):Image.network(
                                              '${ApiConstant.imageURL}${ provider.coachFromId[index].coaches?[index2].imageString ??''}',
                                              height: 100,
                                              width: 100,
                                            ),

                                            Text(
                                              provider.coachFromId[index].coaches?[index2].fullName ??'مستخدم',
                                              style:
                                              getRegularStyle(color: ColorManager.primary),
                                            ),
                                          ],
                                        )),
                                  );

                                } ),
                          ),

                          Text(
                            'availableTime'.tr,
                            style: TextStyle(color: ColorManager.black),
                          ),
                          Container(
                            height: 100.h,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 15.w),
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorManager.gray),
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: DropdownButton<TimeList>(
                              iconEnabledColor: ColorManager.black,
                              icon: Icon(Icons.arrow_drop_down),
                              value:  provider.listTime.first,
                              elevation: 16,
                              style: const TextStyle(color: ColorManager.primary),
                              underline: Container(
                                height: 2,
                                color: ColorManager.primary,
                              ),
                              onChanged: (  value) {
                                provider.changeTime(value!);
                                // provider.showDropdownValue(value);
                              },
                              items: provider.listTime
                                  .map<DropdownMenuItem<TimeList>>(( value) {
                                return DropdownMenuItem<TimeList>(
                                  value: value,
                                  child: Text(provider.timeString),
                                );
                              }).toList(),
                            ),
                          ),


                        ],
                      ),
                    );
                    //   Column(children: [
                    //   Text(provider.coachFromId[index].subCategoryName!.tr),
                    //
                    //   Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     children: [
                    //       Container(
                    //         decoration: BoxDecoration(
                    //             border: provider.isCoachSelection
                    //                 ? null
                    //                 : Border.all(
                    //               color: ColorManager.primary,
                    //               width: 2,
                    //             )),
                    //         child: InkWell(
                    //             onTap: () {
                    //               provider.makeCoachSelectionFalse();
                    //             },
                    //             child: Column(
                    //               children: [
                    //                 Image.asset(
                    //                   'assets/images/avatar.png',
                    //                   height: 100,
                    //                   width: 100,
                    //                 ),
                    //                 Text(
                    //                   'coach1'.tr,
                    //                   style:
                    //                   getRegularStyle(color: ColorManager.primary),
                    //                 ),
                    //               ],
                    //             )),
                    //       ),
                    //       InkWell(
                    //         focusColor: ColorManager.primary,
                    //         borderRadius: BorderRadius.circular(10),
                    //         onTap: () {
                    //           provider.makeCoachSelectionTrue();
                    //         },
                    //         child: Container(
                    //             decoration: BoxDecoration(
                    //                 border: provider.isCoachSelection
                    //                     ? Border.all(
                    //                   color: ColorManager.primary,
                    //                   width: 2,
                    //                 )
                    //                     : null),
                    //             child: Column(
                    //               children: [
                    //                 Image.asset(
                    //                   'assets/images/avatar.png',
                    //                   height: 100,
                    //                   width: 100,
                    //                 ),
                    //                 Text(
                    //                   'coach2'.tr,
                    //                   style:
                    //                   getRegularStyle(color: ColorManager.primary),
                    //                 ),
                    //               ],
                    //             )),
                    //       ),
                    //     ],
                    //   ),
                    //   provider.isCoachSelection
                    //       ? Column(
                    //     children: [
                    //       // Text(
                    //       //   'coachClassDay'.tr,
                    //       //   style: TextStyle(color: ColorManager.black),
                    //       // ),
                    //       // SizedBox(
                    //       //   height: 20.h,
                    //       // ),
                    //       // CardWidget(
                    //       //   title: 'ClassDays'.tr,
                    //       // ),
                    //       Text(
                    //         'availableTime'.tr,
                    //         style: TextStyle(color: ColorManager.black),
                    //       ),
                    //       Container(
                    //         height: 100.h,
                    //         width: double.infinity,
                    //         padding: EdgeInsets.symmetric(
                    //             vertical: 10.h, horizontal: 15.w),
                    //         margin: EdgeInsets.symmetric(vertical: 10.h),
                    //         decoration: BoxDecoration(
                    //             border: Border.all(color: ColorManager.gray),
                    //             color: ColorManager.white,
                    //             borderRadius: BorderRadius.circular(10)),
                    //         child: DropdownButton<String>(
                    //           iconEnabledColor: ColorManager.black,
                    //           icon: Icon(Icons.arrow_drop_down),
                    //           value: provider.dropdownValue,
                    //           elevation: 16,
                    //           style: const TextStyle(color: ColorManager.primary),
                    //           underline: Container(
                    //             height: 2,
                    //             color: ColorManager.primary,
                    //           ),
                    //           onChanged: (String? value) {
                    //             provider.showDropdownValue(value);
                    //           },
                    //           items: provider.timeList
                    //               .map<DropdownMenuItem<String>>((String value) {
                    //             return DropdownMenuItem<String>(
                    //               value: value,
                    //               child: Text(value),
                    //             );
                    //           }).toList(),
                    //         ),
                    //       ),
                    //     ],
                    //   )
                    //       : Column(
                    //     children: [],
                    //   ),
                    // ],);
                  }),
                ),
                // Expanded(
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //       itemCount:20,
                //       // itemCount: provider.coachFromId.length,
                //       itemBuilder: (context,index){
                //     return Container(
                //       margin: EdgeInsets.symmetric(vertical: 20.h),
                //       width: 150,
                //     height: 120,color: ColorManager.red,);
                //     //   Column(children: [
                //     //   Text(provider.coachFromId[index].subCategoryName!.tr),
                //     //   Row(
                //     //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     //     children: [
                //     //       Container(
                //     //         decoration: BoxDecoration(
                //     //             border: provider.isCoachSelection
                //     //                 ? null
                //     //                 : Border.all(
                //     //               color: ColorManager.primary,
                //     //               width: 2,
                //     //             )),
                //     //         child: InkWell(
                //     //             onTap: () {
                //     //               provider.makeCoachSelectionFalse();
                //     //             },
                //     //             child: Column(
                //     //               children: [
                //     //                 Image.asset(
                //     //                   'assets/images/avatar.png',
                //     //                   height: 100,
                //     //                   width: 100,
                //     //                 ),
                //     //                 Text(
                //     //                   'coach1'.tr,
                //     //                   style:
                //     //                   getRegularStyle(color: ColorManager.primary),
                //     //                 ),
                //     //               ],
                //     //             )),
                //     //       ),
                //     //       InkWell(
                //     //         focusColor: ColorManager.primary,
                //     //         borderRadius: BorderRadius.circular(10),
                //     //         onTap: () {
                //     //           provider.makeCoachSelectionTrue();
                //     //         },
                //     //         child: Container(
                //     //             decoration: BoxDecoration(
                //     //                 border: provider.isCoachSelection
                //     //                     ? Border.all(
                //     //                   color: ColorManager.primary,
                //     //                   width: 2,
                //     //                 )
                //     //                     : null),
                //     //             child: Column(
                //     //               children: [
                //     //                 Image.asset(
                //     //                   'assets/images/avatar.png',
                //     //                   height: 100,
                //     //                   width: 100,
                //     //                 ),
                //     //                 Text(
                //     //                   'coach2'.tr,
                //     //                   style:
                //     //                   getRegularStyle(color: ColorManager.primary),
                //     //                 ),
                //     //               ],
                //     //             )),
                //     //       ),
                //     //     ],
                //     //   ),
                //     //   provider.isCoachSelection
                //     //       ? Column(
                //     //     children: [
                //     //       // Text(
                //     //       //   'coachClassDay'.tr,
                //     //       //   style: TextStyle(color: ColorManager.black),
                //     //       // ),
                //     //       // SizedBox(
                //     //       //   height: 20.h,
                //     //       // ),
                //     //       // CardWidget(
                //     //       //   title: 'ClassDays'.tr,
                //     //       // ),
                //     //       Text(
                //     //         'availableTime'.tr,
                //     //         style: TextStyle(color: ColorManager.black),
                //     //       ),
                //     //       Container(
                //     //         height: 100.h,
                //     //         width: double.infinity,
                //     //         padding: EdgeInsets.symmetric(
                //     //             vertical: 10.h, horizontal: 15.w),
                //     //         margin: EdgeInsets.symmetric(vertical: 10.h),
                //     //         decoration: BoxDecoration(
                //     //             border: Border.all(color: ColorManager.gray),
                //     //             color: ColorManager.white,
                //     //             borderRadius: BorderRadius.circular(10)),
                //     //         child: DropdownButton<String>(
                //     //           iconEnabledColor: ColorManager.black,
                //     //           icon: Icon(Icons.arrow_drop_down),
                //     //           value: provider.dropdownValue,
                //     //           elevation: 16,
                //     //           style: const TextStyle(color: ColorManager.primary),
                //     //           underline: Container(
                //     //             height: 2,
                //     //             color: ColorManager.primary,
                //     //           ),
                //     //           onChanged: (String? value) {
                //     //             provider.showDropdownValue(value);
                //     //           },
                //     //           items: provider.timeList
                //     //               .map<DropdownMenuItem<String>>((String value) {
                //     //             return DropdownMenuItem<String>(
                //     //               value: value,
                //     //               child: Text(value),
                //     //             );
                //     //           }).toList(),
                //     //         ),
                //     //       ),
                //     //     ],
                //     //   )
                //     //       : Column(
                //     //     children: [],
                //     //   ),
                //     // ],);
                //   }),
                // ),



                CustomButtonPrimary(
                  text: 'continue'.tr,
                  onpressed: () {
                    Get.toNamed(RouteHelper.diseases);
                  },
                ),

              ],
            )),
      );
    });
  }
}
