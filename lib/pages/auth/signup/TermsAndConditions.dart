import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/snakbar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../services/auth_provider.dart';
import '../../home/NoConnection.dart';

class TermsAndConditions extends StatelessWidget {
  TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return ColorManager.primary;
    }

    return Consumer<AuthProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: OfflineBuilder(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45.h,
                    ),
                    CustomTextTitle(
                      text: 'termsAndConditions'.tr,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Instructions".tr,
                      style: TextStyle(color: ColorManager.gray, fontSize: 12.h),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorManager.primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadiusDirectional.circular(10.r),
                          color: ColorManager.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FutureBuilder<String?>(
                            future: provider.getTerm(),
                            builder: (BuildContext context,
                                AsyncSnapshot<String?> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasData) {
                                  return Html(data: snapshot.data);
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                }
                              }
                              return const CircularProgressIndicator(); // show a loading indicator while waiting for the data
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: provider.isCheckedTerm,
                          onChanged: (bool? value) {
                            provider.changeIsCheckedTerm(value);
                          },
                        ),
                        Text(
                          'agreeTerm'.tr,
                          style: TextStyle(fontSize: 12.h),
                        )
                      ],
                    ),
                    CustomButtonPrimary(
                      text: 'continue'.tr,
                      onpressed: () {
                        !provider.isCheckedTerm
                            ? snakbarWidget(context,
                                    Titel: 'مرحبا بك',
                                    Description: 'هذا الحقل مطلوب اجباري')
                                .error()
                            : Get.offNamed(RouteHelper.confirmCode);
                      },
                    ),
                  ],
                ),
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
