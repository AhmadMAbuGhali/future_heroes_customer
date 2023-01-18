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
import 'package:intl/intl.dart';

class SignUpPersonalData extends StatefulWidget {
  const SignUpPersonalData({super.key});

  @override
  State<SignUpPersonalData> createState() => _SignUpPersonalDataState();
}

class _SignUpPersonalDataState extends State<SignUpPersonalData> {
  bool hidePass = true;
  TextEditingController dateTextInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
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
                child:
                    SizedBox(height: 128, width: 128, child: const LogoAuth())),

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
        ));
  }
}
