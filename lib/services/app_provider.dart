import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/models/class_time_model.dart';
import 'package:future_heroes_customer/models/complaint_replay.dart';
import 'package:future_heroes_customer/models/notification_model.dart';
import 'package:future_heroes_customer/models/order_replay.dart';
import 'package:future_heroes_customer/models/profile_data.dart';
import 'package:future_heroes_customer/services/shared_preference_helper.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../data/api/dio_client.dart';
import '../data/api/exception_handling.dart';
import '../main.dart';
import '../models/respons_massage_code.dart';
import '../resources/color_manager.dart';
import 'auth_provider.dart';

class AppProvider extends ChangeNotifier {
  AppProvider(){
    getComplaintReplay();
    getOrderReplay();
    getClassTime();
    getProfileData();
    getUserNotification();
  }


  int? _id;

  int get id => _id!;

  void setId(int id) {
    _id = id;
    notifyListeners();
  }

  bool isLoading = false;

  changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  File? imageFile;
  File? imageFileNull;

  ProfileData? profileData;

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

  Future<ProfileData?> getProfileData() async {
    try {
      profileData = await DioClient.dioClient.getProfileData();
      getIt<SharedPreferenceHelper>()
          .setEmail(email: profileData!.email.toString());
      getIt<SharedPreferenceHelper>()
          .setPhone(phone: profileData!.phoneNumber.toString());
      getIt<SharedPreferenceHelper>()
          .setDOB(dob: profileData!.dateOfBirth.toString());
      print(profileData!.email.toString());
      notifyListeners();
    } on DioError catch (e) {
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }

  Future<String?> updateImage(File image) async{
    try {
      await DioClient.dioClient
          .updateImage(image);
      print("Done");
      notifyListeners();


    } on DioError catch (e) {

      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();

  }

  Future _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      // File imageFile = File(pickedFile.path);
      final imageTemp = File(pickedFile.path);
      this.imageFile = imageTemp;
      updateImage(imageTemp);
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
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      // File imageFile = File(pickedFile.path);
      final imageTemp = File(pickedFile.path);
      this.imageFile = imageTemp;
      updateImage(imageTemp);

      notifyListeners();
    }
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      decoration:
      BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
      height: 200.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'changePhoto'.tr,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {

                _getFromCamera();
                Navigator.pop(context);
           notifyListeners();
            },
            child: Text('openCamera'.tr),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 5),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Text('or'.tr),
          SizedBox(
            height: 7.h,
          ),
          ElevatedButton(
            onPressed: () {

                _getFromGallery();
                Navigator.pop(context);
                notifyListeners();
            },
            child: Text('openGallery'.tr),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              padding: EdgeInsets.symmetric(horizontal: 95, vertical: 5),
            ),
          ),
        ],
      ),
    );

  }

  Future<String?> postComplaint(String title, String subject) async {
    try {
      await DioClient.dioClient.postComplaint(title, subject);
      print("Done");
      notifyListeners();
    } on DioError catch (e) {
      print(e.toString());
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }
  Future<String?> postOrder(String title, String subject) async {
    try {
      await DioClient.dioClient.postOrder(title, subject);
      print("Done");
      notifyListeners();
    } on DioError catch (e) {
      print(e.toString());
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }


  final TextEditingController reasonController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  Future<String?> postUserPostponement(int id,String reason, String details) async {
    try {
      await DioClient.dioClient.postUserPostponement(id,reason, details);
      print("Done");
      notifyListeners();
    } on DioError catch (e) {
      print(e.toString());
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
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
      print(e.toString());
      return e.response?.data['message'].toString();
    }
    return null;
  }

  List<ComplaintReplay> complaintReplay = [];

  Future<ComplaintReplay?> getComplaintReplay() async {
    try {
      complaintReplay = await DioClient.dioClient.getComplaintReplay();


    } on DioError catch (e) {
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }
  List<NotificationModel> notificationModel = [];
  Future<ComplaintReplay?> getUserNotification() async {
    try {
      notificationModel = await DioClient.dioClient.getUserNotification();


    } on DioError catch (e) {
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }

  List<OrderReplay> orderReplay = [];
  Future<OrderReplay?> getOrderReplay() async {
    try {
      orderReplay = await DioClient.dioClient.getOrderReplay();


    } on DioError catch (e) {
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }

  List<ClassTime> classTime = [];
  Future<ClassTime?> getClassTime() async {
    try {
      classTime = await DioClient.dioClient.getLecture();


    } on DioError catch (e) {
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }

  Future<bool?> getIsActive() async {
    try {
    bool? isActive=  await DioClient.dioClient.getIsActive();
    print("is Active");
    print(isActive.toString());
      getIt<SharedPreferenceHelper>().setActiveStat(activeStat:isActive! ) ;


    } on DioError catch (e) {
      String massage = DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(height: 32.h, child: Center(child: Text(massage))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );
    }
    notifyListeners();
  }
  bool firstTime=true;
  changeFirstTime(bool value){
    firstTime=value;
    notifyListeners();
  }

  logOut() {

    getIt<SharedPreferenceHelper>().setIsLogin(isLogint: false);
    getIt<SharedPreferenceHelper>().setUserToken(userToken: '');
    clearAllData();
  }

  clearAllData(){

    getIt<AuthProvider>().listTime=[];


    getIt<AuthProvider>().coachFromId = []; // نشطة
    getIt<AuthProvider>().offerSub = []; //مغلقة
    getIt<AuthProvider>().offerSelected = []; //مسودة
    getIt<AuthProvider>().diseases = [];
    getIt<AuthProvider>().timeId = [];
    getIt<AuthProvider>().timeListString=[];
    getIt<AuthProvider>().timeListMain=[];
    getIt<AuthProvider>().categorySubforcat=[];
    getIt<AuthProvider>().subCatId=[];
    getIt<AuthProvider>().categorySub=[];
    getIt<AuthProvider>().categoryMain=[];

    getIt<AppProvider>().complaintReplay=[];
    getIt<AppProvider>().orderReplay = [];
    getIt<AppProvider>().classTime = [];



  }

  getAllData(){
    getIt<AuthProvider>().listTime;


    getIt<AuthProvider>().coachFromId; // نشطة
    getIt<AuthProvider>().offerSub; //مغلقة
    getIt<AuthProvider>().offerSelected; //مسودة
    getIt<AuthProvider>().diseases;
    getIt<AuthProvider>().timeId;
    getIt<AuthProvider>().timeListString;
    getIt<AuthProvider>().timeListMain;
    getIt<AuthProvider>().categorySubforcat;
    getIt<AuthProvider>().subCatId;
    getIt<AuthProvider>().categorySub;
    getIt<AuthProvider>().categoryMain;

    getIt<AppProvider>().complaintReplay;
    getIt<AppProvider>().orderReplay ;
    getIt<AppProvider>().classTime ;

  }

}
