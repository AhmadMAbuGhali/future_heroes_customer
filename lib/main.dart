import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/locale/locale.dart';
import 'package:future_heroes_customer/locale/locale_controller.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/services/api_provider.dart';
import 'package:future_heroes_customer/services/auth_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences shaedpref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  shaedpref = await SharedPreferences.getInstance();
  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => APIProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocalController controller = Get.put(MyLocalController());
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            locale: shaedpref.getString("curruntLang") == null
                ? Get.deviceLocale
                : Locale(shaedpref.getString("curruntLang")!),
            translations: MyLocale(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'DroidKufi',
              primaryColor: Color(0xFF8A57DC),
            ),
            initialRoute: RouteHelper.getSplashScreen(),
            getPages: RouteHelper.routes,
          );
        });
  }
}
