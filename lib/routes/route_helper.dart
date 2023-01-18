import 'package:future_heroes_customer/pages/auth/CoachSelection.dart';
import 'package:future_heroes_customer/pages/auth/EndSignUp.dart';
import 'package:future_heroes_customer/pages/auth/NoConnection.dart';
import 'package:future_heroes_customer/pages/auth/SignUpPersonalData.dart';
import 'package:future_heroes_customer/pages/auth/SubscriptionType.dart';
import 'package:future_heroes_customer/pages/auth/TermsAndConditions.dart';
import 'package:future_heroes_customer/pages/auth/diseases.dart';
import 'package:future_heroes_customer/pages/auth/forgetPassword.dart';
import 'package:future_heroes_customer/pages/auth/login.dart';
import 'package:future_heroes_customer/pages/navbar/main_navbar.dart';
import 'package:future_heroes_customer/pages/profile/change_password.dart';
import 'package:future_heroes_customer/pages/profile/class_time.dart';
import 'package:future_heroes_customer/pages/profile/personal_data.dart';
import 'package:future_heroes_customer/pages/profile/postpone%D9%80an%D9%80appointment.dart';
import 'package:future_heroes_customer/pages/profile/profile_page.dart';
import 'package:future_heroes_customer/pages/profile/requests%D9%80and%D9%80complaints.dart';
import 'package:future_heroes_customer/pages/profile/send_complaints.dart';
import 'package:future_heroes_customer/pages/profile/send_requests.dart';
import 'package:future_heroes_customer/pages/profile/subscription_upgrade_successfully.dart';
import 'package:get/get.dart';

import '../pages/auth/SignUppart2.dart';
import '../pages/splash_page/splash_page.dart';

class RouteHelper {
  static const String splashScreen = "/splash-screen";
  static const String initial = "/";
  static const String profile = "/profile";
  static const String personalData = "/personal-Data";
  static const String requestsAndComplaints = "/requests-and-complaints";
  static const String login = "/login";
  static const String noConnection = "/no-connection";
  static const String postponeAnAppointment = "/postpone-an-appointment";
  static const String sendComplaints = "/send-complaints";
  static const String sendRequests = "/send-requests";
  static const String subscriptionUpgradeSuccessfully =
      "/subscription-upgrade-successfully";
  static const String signUpPart2 = "/signup-part2";
  static const String signupPersonalData = "/signup-personal-data";
  static const String termsAndConditions = "/terms-and-conditions";
  static const String changePassword = "/change-password";
  static const String classTime = "/class-time";
  static const String diseases = "/diseases";
  static const String coachSelection = "/coachSelection";
  static const String subscriptionType = "/subscriptionType";
  static const String endSignUp = "/endSignUp";
  static const String forgetPassword = "/forgetPassword";

  static String getSplashScreen() => '$splashScreen';
  static String getInitial() => '$initial';
  static String getProfile() => '$profile';
  static String getPersonalData() => '$personalData';
  static String getRequestsAndComplaints() => '$requestsAndComplaints';
  static String getLogin() => '$login';
  static String getNoConnection() => '$noConnection';
  static String getPostponeAnAppointment() => '$postponeAnAppointment';
  static String getSendComplaints() => '$sendComplaints';
  static String getSendRequests() => '$sendRequests';
  static String getSubscriptionUpgradeSuccessfully() =>
      '$subscriptionUpgradeSuccessfully';
  static String getSignUpPart2() => '$signUpPart2';
  static String getSignupPersonalData() => '$signupPersonalData';
  static String getTermsAndConditions() => '$termsAndConditions';
  static String getChangePassword() => '$changePassword';
  static String getClassTime() => '$classTime';
  static String getDiseases() => '$diseases';
  static String getCoachSelection() => '$coachSelection';
  static String getSubscriptionType() => '$subscriptionType';
  static String getEndSignUp() => '$endSignUp';
  static String getForgetPassword() => '$forgetPassword';

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
      name: noConnection,
      page: () {
        return NoConnectionScreen();
      },
    ),
    GetPage(
      name: postponeAnAppointment,
      page: () {
        return PostponeAnAppointment();
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
      name: signUpPart2,
      page: () {
        return SignUpScreenPart2();
      },
    ),
    GetPage(
      name: signupPersonalData,
      page: () {
        return SignUpPersonalData();
      },
    ),
    GetPage(
      name: termsAndConditions,
      page: () {
        return TermsAndConditions();
      },
    ),
    GetPage(
      name: changePassword,
      page: () {
        return ChangePassword();
      },
    ),
    GetPage(
      name: classTime,
      page: () {
        return ClassTime();
      },
    ),
    GetPage(
      name: diseases,
      page: () {
        return Diseases();
      },
    ),
    GetPage(
      name: coachSelection,
      page: () {
        return CoachSelection();
      },
    ),
    GetPage(
      name: subscriptionType,
      page: () {
        return SubscriptionType();
      },
    ),
    GetPage(
      name: endSignUp,
      page: () {
        return EndSignUp();
      },
    ),
    GetPage(
      name: forgetPassword,
      page: () {
        return ForgetPassword();
      },
    ),
  ];
}
