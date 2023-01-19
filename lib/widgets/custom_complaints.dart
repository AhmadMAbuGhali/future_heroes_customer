
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';

import '../resources/styles_manager.dart';

class CustomComplaints extends StatelessWidget {
  const CustomComplaints ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 7,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
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
                          IconAssets.report,
                          width: 10.w,
                          height: 10.h,
                          // color: ColorManager.white,
                          ),
                      ),
                    ),
                    SizedBox(width: 15.w,),
                    Text("الرد على شكوى نظام التهوية",style: getBoldStyle(color: ColorManager.black,fontSize: 12),),
                  ],
                ),
                collapsed: Container(
                  margin: EdgeInsets.only(right: 55),
                  child: Text(
                    "هناك حقيقة مثبتة منذ زمن طويل  وهي أن المحتوى  المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي.. هناك حقيقة مثبتة منذ زمن طويل  وهي أن المحتوى  المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي.. هناك حقيقة مثبتة منذ زمن طويل  وهي أن ال",
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: getRegularStyle(color:ColorManager.gray),
                  ),
                ),
                expanded: Container(
                  margin: EdgeInsets.only(right: 55),
                  child: Text(
                    "هناك حقيقة مثبتة منذ زمن طويل  وهي أن المحتوى  المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي.. هناك حقيقة مثبتة منذ زمن طويل  وهي أن المحتوى  المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي.. هناك حقيقة مثبتة منذ زمن طويل  وهي أن ال",
                    softWrap: true,
                  ),
                ),
              ),
              SizedBox(height: 5.h,),
              Divider(
                thickness: 2,
                endIndent: 3,
                height: 2.h,
              )
            ],
          );
        });
  }
}
