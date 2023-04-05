import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/resources/styles_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/services/auth_provider.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/LogoAuth.dart';
import 'package:future_heroes_customer/widgets/snakbar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../data/api/apiconst.dart';
import '../../home/NoConnection.dart';

class SignUpScreenPart2 extends StatelessWidget {
  SignUpScreenPart2({super.key});

  var id;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorManager.primary;
      }
      return ColorManager.primary;
    }

    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: OfflineBuilder(
          child: Container(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.only(top: 40.h),
                  child: Column(
                    children: [
                      const LogoAuth(),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextTitle(
                        text: 'welcome'.tr,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'whatCategory'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorManager.gray),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        height: 170.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: provider.categoryMain.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  id = provider.categoryMain[index].id;

                                  provider.getSubCategorysForCategor(id);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                                  decoration: BoxDecoration(
                                      border: provider.idSelectedCategory ==
                                              provider.categoryMain[index].id
                                          ? Border.all(
                                              color: ColorManager.primary,
                                              width: 2,
                                            )
                                          : null),
                                  child: Column(
                                    children: [
                                      provider.categoryMain[index].imageString == ""
                                          ? SvgPicture.asset(
                                              ImageAssets.cultural,
                                              height: 120.h,
                                              width: 120.w,
                                            )
                                          : Image.network(
                                              ApiConstant.imageURL +
                                                  provider.categoryMain[index]
                                                      .imageString!,
                                              height: 120.h,
                                              width: 120.w,
                                            ),
                                      Text(provider.categoryMain[index].name ??
                                          ' null')
                                    ],
                                  ),
                                ),
                              );

                            }),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SingleChildScrollView(
                        child: Column(
                            children: List.generate(
                                provider.categorySubforcat.length,
                                (index) => Column(
                                  children: [
                                    Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 2,
                                                color: ColorManager.primary,
                                              ),
                                              borderRadius: BorderRadius.circular(15.r)),
                                          child: CheckboxListTile(
                                            checkColor: ColorManager.primary,
                                            value: provider.subCatId.contains(
                                                provider.categorySubforcat[index].id),
                                            onChanged: (selected) {
                                              if (provider.subCatId.contains(provider
                                                      .categorySubforcat[index].id) ==
                                                  true) {
                                                provider.removeIdSub(index);
                                              } else {
                                                provider.addIdSub(index);
                                              }
                                              // provider.onUserSelect(selected??false, index);
                                            },
                                            selected: true,
                                            title: Text(
                                              provider.categorySubforcat[index].name ??
                                                  '',
                                              style: getRegularStyle(
                                                  color: ColorManager.primary),
                                            ),
                                          ),
                                        ),
                                    SizedBox(height: 10.h,)
                                  ],
                                ))),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomButtonPrimary(
                        text: 'continue'.tr,
                        onpressed: () {
                          provider.classId=[];
                          provider.getChoesenCoach(provider.subCatId);

                          snakbarWidget(context,
                                  Titel: 'مرحبا بك',
                                  Description: 'قم باكمال عملة التسجيل')
                              .Success();
                          Get.offNamed(RouteHelper.coachSelection);
                        },
                      ),
                    ],
                  ),
                ),
              )),
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
