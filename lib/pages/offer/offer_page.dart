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

class OfferPage extends StatefulWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 60.h,),

            Row(
              children: [
                Text("العروض ",style: getBoldStyle(color: ColorManager.black),),
                CircleAvatar(
                  backgroundColor: ColorManager.primary,
                  radius: 17,
                  child: Text("4",style: getRegularStyle(color: ColorManager.white),),
                ),

              ],
            ),
            Expanded(child: ListView.builder(
                itemCount: 7,
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
                                SizedBox(width: 5.w,),
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
                                SizedBox(width: 15.w,),
                                Text("اقترب الموعد على نهاية اشتراكك",style: getBoldStyle(color: ColorManager.black,fontSize: 14),),
                              ],
                            ),
                            collapsed: Text("هناك حقيقة مثبتة منذ زمن طويل  وهي أن المحتوى  المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي..",
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              children: [
                                Text("هناك حقيقة مثبتة منذ زمن طويل  وهي أن المحتوى  المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي..هناك حقيقة مثبتة منذ زمن طويل  وهي أن المحتوى  المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي.."),
                                Row(children: [
                                  SvgPicture.asset(IconAssets.time,color: ColorManager.primary,),
                                  Text("02 ساعات",style: getRegularStyle(color: ColorManager.primary),),
                                ],),
                                SizedBox(width:150.w,child: CustomButtonPrimary(text: 'طلب استفادة من العرض', onpressed: () {
                                  snakbarWidget(context,
                                      Titel: 'تم تقديم الطلب بنجاح',
                                      Description: 'يمكنك التوجه للنادي لتأكيد  الطلب').Success();
                                },textColor: ColorManager.primary,buttonColor: ColorManager.white,))
                              ],
                            )
                        ),
                        SizedBox(height: 5.h,),
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
