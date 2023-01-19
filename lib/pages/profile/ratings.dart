import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class Ratings extends StatelessWidget {
  const Ratings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child:Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 45.h,
                left: 20.w,
                right: 20.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: ColorManager.primary,
                        )),
                      Text(
                        "المستخدم",
                        style: getBoldStyle(color: ColorManager.primary),
                      ),

                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h,),
  CustomTextTitle(text: "التقييمات"),
            Expanded(child: ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
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
                                    IconAssets.stars,
                                    width: 10.w,
                                    height: 10.h,

                                     color: ColorManager.primary,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15.w,),
                              Text("التقييم الخاص بشهر يناير",style: getBoldStyle(color: ColorManager.black),),
                            ],
                          ),
                          collapsed: Text("انقر لاظهار البيانات",
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          expanded: Column(

                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(children: [
                                    SvgPicture.asset(IconAssets.calendar,color: ColorManager.red,),
                                    Text("01/01/2023",style: getLightStyle(color: ColorManager.red),)
                                  ],),
                                  Row(
                                    children: [
                                      SvgPicture.asset(IconAssets.time,color: ColorManager.green,),
                                      Text("8:00 ص",style: getLightStyle(color: ColorManager.green),)
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("الحضور : ",style: getRegularStyle(color: ColorManager.primary),),
                                  Text(" تقييمك في الحضور هو 3  من  5",style: getMediumStyle(color: ColorManager.black),),


                                ],
                              ),
                              Row(
                                children: [
                                  Text("الالتزام بالزي : ",style: getRegularStyle(color: ColorManager.primary),),
                                  Text(" تقييمك في : الالتزام بالزي هو 3  من  5",style: getMediumStyle(color: ColorManager.black),),


                                ],
                              ),
                              Row(
                                children: [
                                  Text("الالتزام بالتمرينات:",style: getRegularStyle(color: ColorManager.primary),),
                                  Text("تقييمك في الالتزام بالتمرينات هو 3  من5",style: getMediumStyle(color: ColorManager.black),),


                                ],
                              ),
                              Row(
                                children: [
                                  Text("الادب والأخلاق : ",style: getRegularStyle(color: ColorManager.primary),),
                                  Text(" تقييمك في  الادب والأخلاق هو 3  من  5",style: getMediumStyle(color: ColorManager.black),),


                                ],
                              ),
                              Text("ملاحظات أخرى من المدرب:",textAlign: TextAlign.start,style: getRegularStyle(color: ColorManager.primary),),
                              Text("هناك حقيقة مثبتة منذ زمن طويل  وهي أن المحتوى  المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي.. هناك حقيقة مثبتة منذ زمن طويل  وهي أن المحتوى  المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي.. هناك حقيقة مثبتة منذ زمن طويل  وهي أن ال",textAlign: TextAlign.start,)

                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          )
                        ),
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
