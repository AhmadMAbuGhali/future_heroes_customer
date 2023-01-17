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

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: Stack(children: [
        SvgPicture.asset(
          ImageAssets.background,
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorManager.primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadiusDirectional.circular(10),
                      color: ColorManager.white),
                  child: const Text(
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
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.square_outlined,
                      color: ColorManager.primary,
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
                    snakbarWidget(context,
                            Titel: 'مرحبا بك',
                            Description: 'هذا الحقل مطلوب اجباري')
                        .error();
                    Get.offNamed(RouteHelper.getSignupPersonalData());
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
