import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../services/app_provider.dart';
import '../../widgets/CustomButtonPrimary.dart';
import '../../widgets/snakbar.dart';
import '../home/NoConnection.dart';

class SendComplaints extends StatelessWidget {
  SendComplaints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return Scaffold(
        body: OfflineBuilder(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    Get.back();
                                    await provider.getOrderReplay();
                                    await provider.getComplaintReplay();
                                    provider.titleController.clear();
                                    provider.subjectController.clear();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: ColorManager.primary,
                                  )),
                              Text(
                                'requestsAndComplaints'.tr,
                                style:
                                    getBoldStyle(color: ColorManager.primary),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Center(
                          child: CustomTextTitle(
                        text: 'sendComplaint'.tr,
                      )),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'complaintsAddress'.tr,
                        style: const TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomTextFormAuth(
                          hidepassword: false,
                          textInputType: TextInputType.text,
                          myController: provider.titleController,
                          validator: (value) {
                            provider.nullValidation(value);
                          },
                          hintText: 'AddressHint'.tr),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'topic'.tr,
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 8,
                        controller: provider.subjectController,
                        decoration: InputDecoration(
                          fillColor: ColorManager.white,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 14.h),
                          hintText: 'complaintTopic'.tr,
                          hintStyle: getRegularStyle(
                              color: ColorManager.otpDesc,
                              fontSize: FontSize.s12),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorManager.borderTextFiel,
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(12.r)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: const BorderSide(
                                color: ColorManager.primary, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(
                                color: ColorManager.borderTextFiel, width: 1.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1.0.w,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      CustomButtonPrimary(
                          text: "sendComplaint".tr,
                          onpressed: () {
                            provider.postComplaint(
                                provider.titleController.text.trim(),
                                provider.subjectController.text.trim());
                            provider.titleController != null
                                ? snakbarWidget(context,
                                        Titel: 'SentSuccesfully'.tr,
                                        Description: 'TheComplSent'.tr)
                                    .Success()
                                : snakbarWidget(context,
                                        Titel: 'DataError'.tr,
                                        Description: 'EnterAllData'.tr)
                                    .error();
                            provider.titleController.clear();
                            provider.subjectController.clear();
                          }),
                    ],
                  ),
                ),
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
