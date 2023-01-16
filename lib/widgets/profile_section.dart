import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/assets_manager.dart';
import '../resources/styles_manager.dart';

class ProfileSection extends StatelessWidget {
  final String label;
  final bool haveArrow;
  final String icon;
  final Function() onTap;
  Color? myColor;
   ProfileSection({Key? key, required this.label, required this.haveArrow, required this.icon, required this.onTap,this.myColor=Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              haveArrow?SvgPicture.asset(IconAssets.arrow_back):Container(),
             const Spacer(),
              Text(
                label,
                style: getBoldStyle(color: myColor!, fontSize: 12.sp),
              ),
              SizedBox(
                width: 5.w,
              ),
              SvgPicture.asset(icon,color: myColor!,),
            ],
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        const Divider(
          height: 1,
          thickness: 1,
          endIndent: 2,
        ),
        SizedBox(
          height: 7.h,
        ),
      ],
    );
  }
}