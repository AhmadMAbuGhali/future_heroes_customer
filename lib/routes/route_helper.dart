
import 'package:future_heroes_customer/pages/navbar/main_navbar.dart';
import 'package:future_heroes_customer/pages/profile/profile_page.dart';
import 'package:get/get.dart';

import '../pages/splash_page/splash_page.dart';

class RouteHelper {

  static const String splashScreen = "/splash-screen";
  static const String initial = "/";
  static const String profile = "/profile";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage= "/cart-page";

  static String getSplashScreen() => '$splashScreen';
  static String getInitial() => '$initial';
  static String getProfile() => '$initial';



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
        transition: Transition.fadeIn),

  ];
}
