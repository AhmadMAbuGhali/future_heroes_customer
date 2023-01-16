import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';

import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
        designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar", "SA"),
        Locale("en", "US"),
      ],
      locale: Locale("ar", "SA"),
        debugShowCheckedModeBanner: false,

        title: 'Flutter Demo',
        theme: ThemeData(
        fontFamily: 'DroidKufi',
      primaryColor: Color(0xFF8A57DC),

      ),


        initialRoute: RouteHelper.getSplashScreen(),
        getPages: RouteHelper.routes,
      );}
    );
  }
}
