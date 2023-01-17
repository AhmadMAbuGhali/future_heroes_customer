import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/widgets/custom_text_feild.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../resources/styles_manager.dart';
import '../../routes/route_helper.dart';
import '../../widgets/CustomButtonPrimary.dart';
import '../../widgets/CustomTextFormAuth.dart';

class PersonalData extends StatefulWidget {
   PersonalData({Key? key}) : super(key: key);

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
TextEditingController? name = TextEditingController();
bool hidePass = true;
TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: EdgeInsets.only(
                top: 45.h,
                left: 20.w,
                right: 20.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "المستخدم",
                        style: getBoldStyle(color: ColorManager.primary),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            color: ColorManager.primary,
                          )),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 40.h,),
            const SizedBox(
              height: 30,
            ),
             Text(
              'البريد الالكتروني ',
              style: getRegularStyle(color: Colors.black),
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

              hintText:  '   اسم المشترك  ',

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
              myController: dateInput,
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
                    dateInput.text =
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
            SizedBox(height: 20.h,),
            Center(child: TextButton(onPressed: (){
              Get.toNamed(RouteHelper.changePassword);
            }, child: Text("تغيير كلمة المرور",textAlign: TextAlign.center,style: getBoldStyle(color: ColorManager.primary,fontSize: 14),))),
            SizedBox(height: 20.h,),
            CustomButtonPrimary(text: "حفظ", onpressed: (){
              Get.toNamed(RouteHelper.initial);
            }),
          ],
        ),
      ),
    );
  }
}
