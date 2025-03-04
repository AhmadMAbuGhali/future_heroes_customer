import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/src/dio_exception.dart' as dio_exception; // Specific import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/models/class_time_model.dart';
import 'package:future_heroes_customer/models/complaint_replay.dart';
import 'package:future_heroes_customer/models/is_active.dart';
import 'package:future_heroes_customer/models/notification_model.dart';
import 'package:future_heroes_customer/models/offer_model.dart';
import 'package:future_heroes_customer/models/order_replay.dart';
import 'package:future_heroes_customer/models/profile_data.dart';
import 'package:future_heroes_customer/services/shared_preference_helper.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../data/api/dio_client.dart';
import '../main.dart';
import '../models/respons_massage_code.dart';
import '../resources/color_manager.dart';
import 'auth_provider.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    getComplaintReplay();
    getOrderReplay();
    getClassTime();
    getProfileData();
    getUserNotification();
    getOffers();
  }

  int? _idPostpone;

  int get idPostpone => _idPostpone ?? 0; // Added null-safe default

  void setPostponeId(int idPostpone) {
    _idPostpone = idPostpone;
    notifyListeners();
  }

  bool isLoading = false;

  changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  nullValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Required field";
    }
  }

  Map<int, String> daysAr = {
    0: "الأحد",
    1: "الاثنين",
    2: "الثلاثاء",
    3: "الأربعاء",
    4: "الخميس",
    5: "الجمعة",
    6: "السبت",
  };
  Map<int, String> daysEn = {
    0: "Sunday",
    1: "Monday",
    2: "Tuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday",
  };

  // Reset Password from Personal Page
  TextEditingController oldPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController confPass = TextEditingController();

  bool showOldPasswordAuth = true;
  bool showNewPasswordAuth = true;
  bool showConfPasswordAuth = true;

  changeShowOldPasswordAuth() {
    showOldPasswordAuth = !showOldPasswordAuth;
    notifyListeners();
  }

  changeShowNewPasswordAuth() {
    showNewPasswordAuth = !showNewPasswordAuth;
    notifyListeners();
  }

  changeShowConfPasswordAuth() {
    showConfPasswordAuth = !showConfPasswordAuth;
    notifyListeners();
  }

  Future<String?> resetPasswordAuthorize(
      String oldPass, String pass, String conPass) async {
    try {
      ResponsMassageCode? success = await DioClient.dioClient
          .resetPasswordAuthorize(oldPass, pass, conPass);

      if (success!.message != null) {
        notifyListeners();
        return 'true';
      }
    } on DioError catch (e) {
      notifyListeners();
      return e.response?.data['message']?.toString() ?? e.message;
    }
    return null;
  }

  // Profile Data & update Image
  File? imageFile;
  ProfileData? profileData;

  Future<ProfileData?> getProfileData() async {
    try {
      profileData = await DioClient.dioClient.getProfileData();
      getIt<SharedPreferenceHelper>()
          .setEmail(email: profileData!.email.toString());
      getIt<SharedPreferenceHelper>()
          .setPhone(phone: profileData!.phoneNumber.toString());
      getIt<SharedPreferenceHelper>()
          .setDOB(dob: profileData!.dateOfBirth.toString());
      notifyListeners();
      return profileData;
    } on DioError catch (e) {
      String? message = e.response?.data['message']?.toString() ?? e.message;
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(message!))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
      notifyListeners();
      return null;
    }
  }

  Future<String?> updateImage(File image) async {
    try {
      await DioClient.dioClient.updateImage(image);
      notifyListeners();
      return 'success';
    } on DioError catch (e) {
      String? message = e.response?.data['message']?.toString() ?? e.message;
      notifyListeners();
      return message;
    }
  }

  Future _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      final imageTemp = File(pickedFile.path);
      imageFile = imageTemp;
      await updateImage(imageTemp);
      notifyListeners();
    }
  }

  openCamera(BuildContext context) {
    _getFromCamera();
    Navigator.pop(context);
  }

  openGallery(BuildContext context) {
    _getFromGallery();
    Navigator.pop(context);
  }

  Future _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      final imageTemp = File(pickedFile.path);
      imageFile = imageTemp;
      await updateImage(imageTemp);
      notifyListeners();
    }
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      height: 200.h,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text('changePhoto'.tr),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _getFromCamera();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
            ),
            child: Text('openCamera'.tr),
          ),
          SizedBox(height: 7.h),
          Text('or'.tr),
          SizedBox(height: 7.h),
          ElevatedButton(
            onPressed: () {
              _getFromGallery();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              padding: const EdgeInsets.symmetric(horizontal: 95, vertical: 5),
            ),
            child: Text('openGallery'.tr),
          ),
        ],
      ),
    );
  }

  // Order & Complaint
  List<ComplaintReplay> complaintReplay = [];
  Future<String?> postComplaint(String title, String subject) async {
    try {
      await DioClient.dioClient.postComplaint(title, subject);
      notifyListeners();
      return 'success';
    } on DioError catch (e) {
      String? message = e.response?.data['message']?.toString() ?? e.message;
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(message!))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
      notifyListeners();
      return message;
    }
  }

  Future<ComplaintReplay?> getComplaintReplay() async {
    try {
      complaintReplay = await DioClient.dioClient.getComplaintReplay();
      notifyListeners();
      return complaintReplay.isNotEmpty ? complaintReplay.first : null;
    } on DioError catch (e) {
      String? message = e.response?.data['message']?.toString() ?? e.message;
      notifyListeners();
      return null;
    }
  }

  List<OrderReplay> orderReplay = [];
  Future<String?> postOrder(String title, String subject) async {
    try {
      await DioClient.dioClient.postOrder(title, subject);
      notifyListeners();
      return 'success';
    } on DioError catch (e) {
      String? message = e.response?.data['message']?.toString() ?? e.message;
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(message!))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
      notifyListeners();
      return message;
    }
  }

  Future<OrderReplay?> getOrderReplay() async {
    try {
      orderReplay = await DioClient.dioClient.getOrderReplay();
      notifyListeners();
      return orderReplay.isNotEmpty ? orderReplay.first : null;
    } on DioError catch (e) {
      String? message = e.response?.data['message']?.toString() ?? e.message;
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(message!))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
      notifyListeners();
      return null;
    }
  }

  // Postponement
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  Future<String?> postUserPostponement(
      int id, String reason, String details) async {
    try {
      await DioClient.dioClient.postUserPostponement(id, reason, details);
      notifyListeners();
      return 'success';
    } on DioError catch (e) {
      String? message = e.response?.data['message']?.toString() ?? e.message;
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(message!))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
      notifyListeners();
      return message;
    }
  }

  // Notification
  List<NotificationModel> notificationModel = [];
  Future<ComplaintReplay?> getUserNotification() async {
    try {
      notificationModel = await DioClient.dioClient.getUserNotification();
      notifyListeners();
      return null;
    } on DioError catch (e) {
      String? message = e.response?.data['message']?.toString() ?? e.message;
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(message!))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
      notifyListeners();
      return null;
    }
  }

  // Class Time
  List<ClassTime> classTime = [];
  Future<ClassTime?> getClassTime() async {
    try {
      classTime = await DioClient.dioClient.getLecture();
      notifyListeners();
      return classTime.isNotEmpty ? classTime.first : null;
    } on DioError catch (e) {
      String? message = e.response?.data['message']?.toString() ?? e.message;
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(message!))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
      notifyListeners();
      return null;
    }
  }

  // Offers
  TextEditingController titleController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController ReqtitleController = TextEditingController();
  TextEditingController ReqsubjectController = TextEditingController();

  List<OffersModel> listOffer = [];

  Future<String?> getOffers() async {
    try {
      listOffer = await DioClient.dioClient.getOffer();
      notifyListeners();
      if (listOffer.isEmpty) {
        return "No offers found";
      }
      return null;
    } on DioError catch (e) {
      String? message = e.response?.data['message']?.toString() ?? e.message;
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(message!))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
      notifyListeners();
      return message;
    }
  }

  Future<String?> sendOfferId(int id) async {
    try {
      await DioClient.dioClient.sendOfferId(id);
      notifyListeners();
      return 'success';
    } on DioError catch (e) {
      String? message = e.response?.data['message']?.toString() ?? e.message;
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(message!))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
      notifyListeners();
      return message;
    }
  }

  // Is Active
  Future<void> checkIsActive() async {
    try {
      IsACtive? isActive = await DioClient.dioClient.getIsActive();
      if (isActive != null && isActive.isActive != null) {
        getIt<SharedPreferenceHelper>()
            .setActiveStat(activeStat: isActive.isActive!);
      }
    } on DioError catch (e) {
      String? message = e.response?.data['message']?.toString() ?? e.message;
      notifyListeners();
    }
  }

  logOut() {
    getIt<SharedPreferenceHelper>().setIsLogin(isLogint: false);
    getIt<SharedPreferenceHelper>().setRememberMe(rememberMe: false);
    getIt<SharedPreferenceHelper>().setUserToken(userToken: '');
    clearAllData();
    notifyListeners();
  }

  clearAllData() {
    // Auth Provider
    getIt<AuthProvider>().categoryMain = [];
    getIt<AuthProvider>().categorySub = [];
    getIt<AuthProvider>().subCatId = [];
    getIt<AuthProvider>().coachFromId = [];
    getIt<AuthProvider>().listTime = [];
    getIt<AuthProvider>().timeListMain = [];
    getIt<AuthProvider>().timeListMap = {};
    getIt<AuthProvider>().maptimeListString = {};
    getIt<AuthProvider>().timeListString = [];
    getIt<AuthProvider>().timeId = [];
    getIt<AuthProvider>().classId = [];
    getIt<AuthProvider>().diseases = [];
    getIt<AuthProvider>().diseasesId = [];
    getIt<AuthProvider>().offerSelected = [];
    getIt<AuthProvider>().listPackages = [];

    // AppProvider
    orderReplay = [];
    complaintReplay = [];
    notificationModel = [];
    classTime = [];
    notifyListeners();
  }

  @override
  void dispose() {
    oldPass.dispose();
    newPass.dispose();
    confPass.dispose();
    reasonController.dispose();
    detailsController.dispose();
    titleController.dispose();
    subjectController.dispose();
    ReqtitleController.dispose();
    ReqsubjectController.dispose();
    super.dispose();
  }
}