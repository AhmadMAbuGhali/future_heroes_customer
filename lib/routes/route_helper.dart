import 'package:future_heroes_customer/pages/auth/login.dart';
import 'package:future_heroes_customer/pages/navbar/main_navbar.dart';
import 'package:future_heroes_customer/pages/profile/personal_data.dart';
import 'package:future_heroes_customer/pages/profile/profile_page.dart';
import 'package:get/get.dart';

import '../pages/splash_page/splash_page.dart';

class RouteHelper {
  static const String splashScreen = "/splash-screen";
  static const String initial = "/";
  static const String profile = "/profile";
  static const String personalData = "/personal-Data";

  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String login = "/login";

  static String getSplashScreen() => '$splashScreen';
  static String getInitial() => '$initial';
  static String getProfile() => '$profile';
  static String getPersonalData() => '$personalData';
  static String getlogin() => '$login';

  static List<GetPage> routes = [
    GetPage(
        name: splashScreen,
        page: () {
          return SplashScreen();
        }),
    GetPage(
        name: initial,
        page: () {
          return MainNavBar();
        }),
    GetPage(
      name: profile,
      page: () {
        return ProfilePage();
      },
    ),
    GetPage(
      name: personalData,
      page: () {
        return PersonalData();
      },
    ),
    GetPage(
      name: login,
      page: () {
        return Login();
      },
    ),
  ];
}
