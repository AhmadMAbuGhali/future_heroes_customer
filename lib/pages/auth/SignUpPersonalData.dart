import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextFormAuth.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/LogoAuth.dart';
import 'package:future_heroes_customer/widgets/snakbar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class SignUpPersonalData extends StatefulWidget {
  const SignUpPersonalData({super.key});

  @override
  State<SignUpPersonalData> createState() => _SignUpPersonalDataState();
}

class _SignUpPersonalDataState extends State<SignUpPersonalData> {
  File? imageFile;

  bool hidePass = true;
  TextEditingController dateTextInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 60.h,
              ),
              Center(
                child: CustomTextTitle(
                  text: 'البيانات الشخصية',
                ),
              ),
              Center(
                child: Row(
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
                        child: CircleAvatar(
                          radius: 60,
                          foregroundImage: imageFile == null
                              ? Image.asset(
                                  ImageAssets.avatar,
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
              ),

              const SizedBox(
                height: 30,
              ),
              const Text(
                'البريد الالكتروني ',
                style: TextStyle(fontSize: 12),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              CustomTextFormAuth(
                hidepassword: false,
                textInputType: TextInputType.emailAddress,

                hintText: 'البريد الالكتروني ',
                //  labelText: 'البريد الالكتروني / رقم الهاتف',
                //  iconData: Icons.email_outlined,
              ),
              //  const SizedBox(
              //     height: 10,
              //   ),
              const Text(
                'كلمة المرور',
                style: TextStyle(fontSize: 12),
              ),

              CustomTextFormAuth(
                textInputType: TextInputType.visiblePassword,
                hidepassword: hidePass,
                pressSuffixIcon: () {
                  setState(() {
                    hidePass = !hidePass;
                  });
                },
                hintText: 'كلمة المرور',
                // labelText: 'كلمة المرور',
                iconData: hidePass ? Icons.visibility : Icons.visibility_off,
              ),
              const Text(
                '   اسم المشترك  ',
                style: TextStyle(fontSize: 12),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              CustomTextFormAuth(
                hidepassword: false,
                textInputType: TextInputType.emailAddress,

                hintText: '   اسم المشترك  ',

                //  labelText: 'البريد الالكتروني / رقم الهاتف',
                //  iconData: Icons.email_outlined,
              ),
              const Text(
                'تاريخ الميلاد',
                style: TextStyle(fontSize: 12),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              CustomTextFormAuth(
                myController: dateTextInput,
                pressSuffixIcon: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));
                  if (pickedDate != null) {
                    print(pickedDate);
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(formattedDate);
                    setState(() {
                      dateTextInput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
                hintText: 'YYYY/MM/DD',
                iconData: Icons.calendar_month_outlined,
              ),
              const Text(
                'رقم الهاتف',
                style: TextStyle(fontSize: 12),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              CustomTextFormAuth(
                hidepassword: false,
                textInputType: TextInputType.number,
                iconData: Icons.phone,
                hintText: 'رقم الهاتف',
                //  labelText: 'البريد الالكتروني / رقم الهاتف',
                //  iconData: Icons.email_outlined,
              ),
              CustomButtonPrimary(
                text: 'متابعة',
                onpressed: () {
                  Get.toNamed(RouteHelper.diseases);
                },
              ),
            ]),
          ),
        ));
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
      height: 220.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'تغيير الصورة الشخصية',
          ),
          SizedBox(
            height: 8.h,
          ),
          CustomButtonPrimary(
              text: "فتح الكاميرا",
              onpressed: () {
                setState(() {
                  _getFromCamera();
                  Navigator.pop(context);
                });
              }),
          Text("أو"),
          CustomButtonPrimary(
              text: "قم بالاختيار من المعرض",
              onpressed: () {
                setState(() {
                  _getFromGallery();
                  Navigator.pop(context);
                });
              }),
        ],
      ),
    );
  }
}
