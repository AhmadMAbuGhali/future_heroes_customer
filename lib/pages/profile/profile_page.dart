import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:image_picker/image_picker.dart';

import '../../resources/assets_manager.dart';
import '../../resources/styles_manager.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                   SizedBox(height: 30.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (builder) => bottomSheet(),
                        );

                        // setState(() {
                        //   _getFromGallery();
                        // });
                      },
                      child: Center(
                        child:  CircleAvatar(
                          radius: 60,
                          foregroundImage: imageFile == null
                              ? Image.asset(
                            ImageAssets.logopng,
                          ).image
                              : Image.file(
                            imageFile!,
                            fit: BoxFit.cover,
                          ).image,
                          backgroundImage: imageFile == null
                              ? Image.asset(
                            ImageAssets.logopng,
                          ).image
                              : Image.file(
                            imageFile!,
                            fit: BoxFit.cover,
                          ).image,
                        ),
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 5.h,),
                Text("يوسف الجزار ",style: getBoldStyle(color: Colors.black),),
                SizedBox(height: 5.h,),
                Text("Yousef.n.aljazzar@gmail.com",style: getRegularStyle(color: Colors.black),),
                SizedBox(height: 40.h,),
                //معلومات الشخصية
                Row(
                  children: [

                    SvgPicture.asset(IconAssets.arrow_back),
                    Spacer(),
                    Text("المعلومات الشخصية",style: getBoldStyle(color: Colors.black,fontSize: 12.sp),),
                    SizedBox(width: 5.w,),
                    SvgPicture.asset(IconAssets.user),

                  ],
                ),
               SizedBox(height: 7.h,),
               const Divider(
                  height: 1,
                  thickness: 1,
                  endIndent: 2,
                ),
                SizedBox(height: 7.h,),

                //الطلبات والشكاوي
                Row(
                  children: [

                    SvgPicture.asset(IconAssets.arrow_back),
                    Spacer(),
                    Text("الطلبات والشكاوي",style: getBoldStyle(color: Colors.black,fontSize: 12.sp),),
                    SizedBox(width: 5.w,),
                    SvgPicture.asset(IconAssets.paper),

                  ],
                ),
                SizedBox(height: 7.h,),
                const Divider(
                  height: 1,
                  thickness: 1,
                  endIndent: 2,
                ),
                SizedBox(height: 7.h,),
                //مواعيد التدريب
                Row(
                  children: [

                    SvgPicture.asset(IconAssets.arrow_back),
                    Spacer(),
                    Text("مواعيد التدريب",style: getBoldStyle(color: Colors.black,fontSize: 12.sp),),
                    SizedBox(width: 5.w,),
                    SvgPicture.asset(IconAssets.calendar),

                  ],
                ),
                SizedBox(height: 7.h,),
                const Divider(
                  height: 1,
                  thickness: 1,
                  endIndent: 2,
                ),
                SizedBox(height: 7.h,),
                //ترقية الاشتراك
                Row(
                  children: [

                    SvgPicture.asset(IconAssets.arrow_back),
                    Spacer(),
                    Text("ترقية الاشتراك",style: getBoldStyle(color: Colors.black,fontSize: 12.sp),),
                    SizedBox(width: 5.w,),
                    SvgPicture.asset(IconAssets.jewelry),

                  ],
                ),
                SizedBox(height: 7.h,),
                const Divider(
                  height: 1,
                  thickness: 1,
                  endIndent: 2,
                ),
                SizedBox(height: 7.h,),
                //العروض
                Row(
                  children: [

                    SvgPicture.asset(IconAssets.arrow_back),
                    Spacer(),
                    Text("العروض",style: getBoldStyle(color: Colors.black,fontSize: 12.sp),),
                    SizedBox(width: 5.w,),
                    SvgPicture.asset(IconAssets.localoffer),

                  ],
                ),
                SizedBox(height: 7.h,),
                const Divider(
                  height: 1,
                  thickness: 1,
                  endIndent: 2,
                ),
                SizedBox(height: 7.h,),
                //التقيمات
                Row(
                  children: [

                    SvgPicture.asset(IconAssets.arrow_back),
                    Spacer(),
                    Text("التقيمات",style: getBoldStyle(color: Colors.black,fontSize: 12.sp),),
                    SizedBox(width: 5.w,),
                    SvgPicture.asset(IconAssets.stars),

                  ],
                ),
                SizedBox(height: 7.h,),
                const Divider(
                  height: 1,
                  thickness: 1,
                  endIndent: 2,
                ),
                SizedBox(height: 7.h,),
                //تسجيل الخروج
                Row(
                  children: [

Spacer(),
                    Text("تسجيل الخروج",style: getBoldStyle(color: Colors.red,fontSize: 12.sp),),
                    SizedBox(width: 5.w,),
                    SvgPicture.asset(IconAssets.user,color: Colors.red,),

                  ],
                ),
                SizedBox(height: 5.h,),
                const Divider(
                  height: 1,
                  thickness: 1,
                  endIndent: 2,
                ),
                SizedBox(height: 5.h,),
                //حذف الحساب
                Row(
                  children: [

                    Spacer(),
                    Text("حذف الحساب",style: getBoldStyle(color: Colors.red,fontSize: 12.sp),),
                    SizedBox(width: 5.w,),
                    SvgPicture.asset(IconAssets.delete,color: Colors.red,),

                  ],
                ),
                SizedBox(height: 5.h,),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      // File imageFile = File(pickedFile.path);
      final imageTemp = File(pickedFile.path);
      setState(() => this.imageFile = imageTemp);
    }
  }

  Future _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      // File imageFile = File(pickedFile.path);
      final imageTemp = File(pickedFile.path);
      setState(() => this.imageFile = imageTemp);
    }
  }
  Widget bottomSheet() {
    return Container(
      decoration:
      BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
      height: 180.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'تغيير الصورة الشخصية',

          ),
          SizedBox(
            height: 20,
          ),

          ElevatedButton(onPressed: (){
            setState(() {
              _getFromCamera();
              Navigator.pop(context);
            });
          }, child:   Text("فتح الكاميرا"),
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.primary,
            padding: EdgeInsets.symmetric(horizontal: 130, vertical: 5),

          ),),

          SizedBox(height: 7.h,),
          Text("أو"),
          SizedBox(height: 7.h,),
          ElevatedButton(onPressed: (){
            setState(() {
              _getFromGallery();
              Navigator.pop(context);
            });
          }, child:   Text("قم بالاختيار من المعرض"),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              padding: EdgeInsets.symmetric(horizontal: 95, vertical: 5),

            ),),

        ],
      ),
    );
  }
}
