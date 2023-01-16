import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/widgets/custom_text_feild.dart';

class PersonalData extends StatelessWidget {
   PersonalData({Key? key}) : super(key: key);
TextEditingController? name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 90.h,),
            CustomTextFeild(hintText: "email", label: "البريد الالكتروني", controller: name!)
          ],
        ),
      ),
    );
  }
}
