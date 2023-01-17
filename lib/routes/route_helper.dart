
import 'package:future_heroes_customer/pages/auth/login.dart';
import 'package:future_heroes_customer/pages/navbar/main_navbar.dart';
import 'package:future_heroes_customer/pages/profile/personal_data.dart';
import 'package:future_heroes_customer/pages/profile/postpone%D9%80an%D9%80appointment.dart';
import 'package:future_heroes_customer/pages/profile/profile_page.dart';
import 'package:future_heroes_customer/pages/profile/requests%D9%80and%D9%80complaints.dart';
import 'package:future_heroes_customer/pages/profile/send_requests.dart';
import 'package:get/get.dart';

import '../pages/profile/send_complaints.dart';
import '../pages/profile/subscription_upgrade_successfully.dart';
import '../pages/splash_page/splash_page.dart';

class RouteHelper {

  static const String splashScreen = "/splash-screen";
  static const String initial = "/";
  static const String profile = "/profile";
  static const String personalData = "/personal-Data";
  static const String requestsAndComplaints = "/requests-and-complaints";
  static const String login = "/login";
  static const String sendComplaints = "/send-complaints";
  static const String sendRequests = "/send-requests";
  static const String subscriptionUpgradeSuccessfully = "/subscription-upgrade-successfully";
  static const String postponeAnAppointment = "/postpone-an-appointment";



  static String getSplashScreen() => '$splashScreen';
  static String getInitial() => '$initial';
  static String getProfile() => '$profile';
  static String getPersonalData() => '$personalData';
  static String getRequestsAndComplaints() => '$requestsAndComplaints';
  static String getLogin() => '$login';
  static String getSendComplaints() => '$sendComplaints';
  static String getRequests() => '$sendRequests';
  static String getSubscriptionUpgradeSuccessfully() => '$subscriptionUpgradeSuccessfully';
  static String getPostponeAnAppointment() => '$postponeAnAppointment';



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
        name: requestsAndComplaints,
        page: () {
          return RequestsAndComplaints();
        },
       ),
    GetPage(
        name: login,
        page: () {
          return Login();
        },
       ),
    GetPage(
        name: sendComplaints,
        page: () {
          return SendComplaints();
        },
       ),
    GetPage(
        name: sendRequests,
        page: () {
          return SendRequests();
        },
       ),
    GetPage(
        name: subscriptionUpgradeSuccessfully,
        page: () {
          return SubscriptionUpgradeSuccessfully();
        },
       ),
    GetPage(
        name: postponeAnAppointment,
        page: () {
          return PostponeAnAppointment();
        },
       ),

  ];
}
