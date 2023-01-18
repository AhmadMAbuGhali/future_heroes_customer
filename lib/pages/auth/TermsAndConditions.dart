import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_customer/widgets/CustomTextTitle.dart';
import 'package:future_heroes_customer/widgets/snakbar.dart';
import 'package:get/get.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return ColorManager.primary;
    }

    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45.h,
                  ),
                  CustomTextTitle(
                    text: 'الشروط والاحكام',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    '''تعليمات وشروط
       يجب على المشترك في الصالة التقيد بها''',
                    style: TextStyle(color: ColorManager.gray, fontSize: 12.h),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorManager.primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadiusDirectional.circular(10),
                        color: ColorManager.white),
                    child: Text(
                      '''الالتزام بالزي الرياضي الكامل
      الحفاظ على نظافة الصالة .
      يمنع دخول الوجبات داخل الصالة .
      عدم اصطحاب الأطفال .
      في حالة عدم التقيد بالنظام والآداب الإسلامية في الصالة يحق للصالة
      إلغاء العضوية نهائيا وعدم استرجاع مبلغ الاشتراك .
      رسوم عضوية الاشتراك غير قابلة للاسترجاع نهائيا في أي حال من
      الأحوال وفي حالة عدم تسديد رسوم التجديد في موعدها تعتبر
      العضوية منتهية .
      في حالة الاشتراك وعدم الحضور يكون الاشتراك ساري المفعول ولا
      يتوقف إلا في حالة إبلاغ أدارة المركز , ويعتبر الاشتراك بعد انتهاء
      المدة منتهي الصلاحية .
      لا يحق تبديل الاشتراك لأي فرد آخر وفي حالة عدم رغبة المشترك في
      الاستمرار في أي حال من الأحوال لا يسترجع المبلغ نهائيا .
      يحق للعميل إيقاف اشتراكه لمدة 2 حصص تدريبية باشتراك الشهر ,
      و 6 حصص تدريبية باشتراك الثلاث اشهر .
      
      لإيقاف الاشتراك يجب التواصل مع إدارة المركز بإرسال رسالة أو
      اتصال .
      
      يحق للمركز تصوير الحصص التدريبية للمشتركين أثناء التدريب
      ونشرها على حسابات التواصل الاجتماعي الخاصة بالمركز .''',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Text(
                        'أوافق على جميع الشروط والأحكام',
                        style: TextStyle(fontSize: 12.h),
                      )
                    ],
                  ),

                  CustomButtonPrimary(
                    text: 'متابعة',
                    onpressed: () {
                      !isChecked
                          ? snakbarWidget(context,
                          Titel: 'مرحبا بك',
                          Description: 'هذا الحقل مطلوب اجباري')
                          .error()
                          : Get.offNamed(RouteHelper.signupPersonalData);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
