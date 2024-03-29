import 'package:future_heroes_customer/pages/Guest/Guest_Offers.dart';
import 'package:future_heroes_customer/pages/Guest/Guest_profile_page.dart';
import 'package:future_heroes_customer/pages/Guest/Guest_qr_code.dart';
import 'package:future_heroes_customer/pages/Guest/Navbar_Guest.dart';
import 'package:future_heroes_customer/pages/Guest/NotificationPageGuest.dart';
import 'package:future_heroes_customer/pages/auth/login/SuccessLogin.dart';
import 'package:future_heroes_customer/pages/auth/login/codeVerification.dart';
import 'package:future_heroes_customer/pages/auth/login/forgetPassword.dart';
import 'package:future_heroes_customer/pages/auth/login/login.dart';
import 'package:future_heroes_customer/pages/auth/login/setPassword.dart';
import 'package:future_heroes_customer/pages/auth/signup/CoachSelection.dart';
import 'package:future_heroes_customer/pages/auth/signup/EndSignUp.dart';
import 'package:future_heroes_customer/pages/auth/signup/SignUpPersonalData.dart';
import 'package:future_heroes_customer/pages/auth/signup/SignUppart2.dart';
import 'package:future_heroes_customer/pages/auth/signup/SubscriptionType.dart';
import 'package:future_heroes_customer/pages/auth/signup/TermsAndConditions.dart';
import 'package:future_heroes_customer/pages/auth/signup/confirm_code.dart';
import 'package:future_heroes_customer/pages/auth/signup/diseases.dart';
import 'package:future_heroes_customer/pages/home/home_screen.dart';
import 'package:future_heroes_customer/pages/navbar/main_navbar.dart';
import 'package:future_heroes_customer/pages/onBoarding/onBoarding.dart';
import 'package:future_heroes_customer/pages/profile/change_password.dart';
import 'package:future_heroes_customer/pages/profile/class_time.dart';
import 'package:future_heroes_customer/pages/profile/personal_data.dart';
import 'package:future_heroes_customer/pages/profile/postpone%D9%80an%D9%80appointment.dart';
import 'package:future_heroes_customer/pages/profile/profile_page.dart';
import 'package:future_heroes_customer/pages/profile/ratings.dart';
import 'package:future_heroes_customer/pages/profile/requests%D9%80and%D9%80complaints.dart';
import 'package:future_heroes_customer/pages/profile/send_complaints.dart';
import 'package:future_heroes_customer/pages/profile/send_requests.dart';
import 'package:future_heroes_customer/pages/profile/subscription_upgrade_successfully.dart';
import 'package:get/get.dart';

import '../pages/Guest/GuestHome.dart';
import '../pages/profile/language.dart';
import '../pages/profile/subscription_upgrade.dart';
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
  static const String signUp = "/signup";
  static const String signupPersonalData = "/signup-personal-data";
  static const String termsAndConditions = "/terms-and-conditions";
  static const String changePassword = "/change-password";
  static const String classTime = "/class-time";
  static const String confirmCode = "/confirm-code";
  static const String diseases = "/diseases";
  static const String coachSelection = "/coachSelection";
  static const String subscriptionType = "/subscriptionType";
  static const String endSignUp = "/endSignUp";
  static const String forgetPassword = "/forgetPassword";
  static const String subscriptionUpgrade = "/subscription-upgrade";
  static const String ratings = "/ratings";
  static const String setPassword = "/setPassword";
  static const String codeVerification = "/codeVerification";
  static const String onBoarding = "/onBoarding";
  static const String successLogin = "/successLogin";
  static const String homeScreen = "/homeScreen";
  static const String language = "/language";
  static const String guestHome = "/GuestHome";
  static const String guestInitial = "/GuestNavBar";
  static const String notificationPageGuest = "/NotificationPageGuest";
  static const String guestOffers = "/GuestOffers";
  static const String guestQRCode = "/GuestQRCode";
  static const String guestProfilePage = "/GuestProfilePage";

  static String getSplashScreen() => splashScreen;
  static String getInitial() => initial;
  static String getProfile() => profile;
  static String getPersonalData() => personalData;
  static String getRequestsAndComplaints() => requestsAndComplaints;
  static String getLogin() => login;
  static String getNoConnection() => noConnection;
  static String getPostponeAnAppointment() => postponeAnAppointment;
  static String getSendComplaints() => sendComplaints;
  static String getSendRequests() => sendRequests;
  static String getSubscriptionUpgradeSuccessfully() =>
      subscriptionUpgradeSuccessfully;
  static String getSignUpPart2() => signUpPart2;
  static String getSignUp() => signUp;
  static String getSignupPersonalData() => signupPersonalData;
  static String getTermsAndConditions() => termsAndConditions;
  static String getChangePassword() => changePassword;
  static String getClassTime() => classTime;
  static String getConfirmCode() => confirmCode;
  static String getDiseases() => diseases;
  static String getCoachSelection() => coachSelection;
  static String getSubscriptionType() => subscriptionType;
  static String getEndSignUp() => endSignUp;
  static String getForgetPassword() => forgetPassword;
  static String getSubscriptionUpgrade() => subscriptionUpgrade;
  static String getRatings() => ratings;
  static String getSetPassword() => setPassword;
  static String getCodeVerification() => codeVerification;
  static String getOnBoarding() => onBoarding;
  static String getSuccessLogin() => successLogin;
  static String getHomeScreen() => homeScreen;
  static String getLanguage() => language;
  static String getGuestHome() => guestHome;
  static String getGuestNavBar() => guestInitial;
  static String getNotificationPageGuest() => notificationPageGuest;
  static String getGuestOffers() => guestOffers;
  static String getGuestQRCode() => guestQRCode;
  static String getGuestProfilePage() => guestProfilePage;

  static List<GetPage> routes = [
    GetPage(
        name: splashScreen,
        page: () {
          return const SplashScreen();
        }),
    GetPage(
        name: initial,
        page: () {
          return const MainNavBar();
        }),
    GetPage(
        name: notificationPageGuest,
        page: () {
          return const NotificationPageGuest();
        }),
    GetPage(
        name: guestInitial,
        page: () {
          return const GuestNavBar();
        }),
    GetPage(
        name: guestProfilePage,
        page: () {
          return GuestProfilePage();
        }),
    GetPage(
        name: guestQRCode,
        page: () {
          return const GuestQRCode();
        }),
    GetPage(
        name: guestOffers,
        page: () {
          return const GuestOffers();
        }),
    GetPage(
        name: guestHome,
        page: () {
          return const GuestHome();
        }),
    GetPage(
        name: homeScreen,
        page: () {
          return HomeScreen();
        }),
    GetPage(
      name: profile,
      page: () {
        return const ProfilePage();
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
        return const RequestsAndComplaints();
      },
    ),
    GetPage(
      name: login,
      page: () {
        return Login();
      },
    ),
    GetPage(
      name: confirmCode,
      page: () {
        return const ConfirmCode();
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
        return const SubscriptionUpgradeSuccessfully();
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
        return const ClassTime();
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
        return const EndSignUp();
      },
    ),
    GetPage(
      name: forgetPassword,
      page: () {
        return ForgetPassword();
      },
    ),
    GetPage(
      name: subscriptionUpgrade,
      page: () {
        return SubscriptionUpgrade();
      },
    ),
    GetPage(
      name: ratings,
      page: () {
        return const Ratings();
      },
    ),
    GetPage(
      name: setPassword,
      page: () {
        return SetPassword();
      },
    ),
    GetPage(
      name: codeVerification,
      page: () {
        return const CodeVerification();
      },
    ),
    GetPage(
      name: onBoarding,
      page: () {
        return const OnBoarding();
      },
    ),
    GetPage(
      name: successLogin,
      page: () {
        return const SuccessLogin();
      },
    ),
    GetPage(
      name: language,
      page: () {
        return const Language();
      },
    ),
  ];
}
