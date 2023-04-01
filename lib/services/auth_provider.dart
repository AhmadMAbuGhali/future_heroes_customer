import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:future_heroes_customer/services/shared_preference_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/data/api/dio_client.dart';
import 'package:future_heroes_customer/data/api/exception_handling.dart';
import 'package:future_heroes_customer/models/category.dart';
import 'package:future_heroes_customer/models/disease_model.dart';
import 'package:future_heroes_customer/models/register_model.dart';
import 'package:future_heroes_customer/models/sub_category.dart';
import 'package:future_heroes_customer/models/subscribtion_model.dart';
import 'package:future_heroes_customer/models/time_list.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';
import '../models/choess_coach_model.dart';
import '../models/class_time_model.dart';
import '../models/login_model.dart';
import '../models/respons_massage_code.dart';
import '../models/terms_and_conditions_model.dart';
import '../widgets/snakbar.dart';
import 'app_provider.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    getCategory();
    getSubCategory();
    getDisease();
    getOffer();
  }

  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;



  List<int> classId = [];
  // general
  bool _loading = false;
  bool isLoading = false;

  bool get loading => _loading;

  changeIsLoding(bool value) {
    isLoading = value;
    notifyListeners();
  }

// login page
  bool rememberMe = false;
  bool showPasswordLogin = true;
  TextEditingController emailLoginPage = TextEditingController();
  TextEditingController passwordLoginPage = TextEditingController();

  changeShowPasswordLogin() {
    showPasswordLogin = !showPasswordLogin;
    notifyListeners();
  }

  login(String email, String password, BuildContext context) async {
    _loading = true;
    notifyListeners();
    try {
      LoginModel? response = await DioClient.dioClient.login(email, password);
      if (response!.status== "success") {
        getIt<SharedPreferenceHelper>()
            .setUserToken(userToken: response.token!);
        getIt<SharedPreferenceHelper>()
            .setStatus(statusString: response.status!);
        getIt<SharedPreferenceHelper>()
            .setActiveStat(activeStat: response.isActive!);
        _loading = false;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;

      snakbarWidget(context,
              Titel: 'Network Error'.tr,
              Description: 'Make sure that Network is Good'.tr)
          .error();
      notifyListeners();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  changeRememberMe() {
    rememberMe = !rememberMe;
    notifyListeners();
  }

  // SignUp Page
  bool showPasswordSignUp = true;
  File? imageFile;
  File? imageFileNull;
  DateTime? pickedDate;
  TextEditingController emailSignUpPage = TextEditingController();
  TextEditingController passwordSignUpPage = TextEditingController();
  TextEditingController nameSignUpPage = TextEditingController();
  TextEditingController dateTextInputSignUPPage = TextEditingController();
  TextEditingController phoneSignUpPage = TextEditingController();

  changeShowPasswordSignUP() {
    showPasswordSignUp = !showPasswordSignUp;
    notifyListeners();
  }

  register(File image, String fullName, DateTime dob, String phoneNumber,
      String email, String password) async {
    try {
      RegisterModel? responseRegister = await DioClient.dioClient
          .register(image, fullName, dob, phoneNumber, email, password);
      changeIsLoding(false);
    } on DioError catch (e) {
      changeIsLoding(true);
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

  showDateText(String date) {
    dateTextInputSignUPPage.text = date;
    notifyListeners();
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
      notifyListeners();
    }
  }

  // term

  bool isCheckedTerm = false;

  changeIsCheckedTerm(bool? value) {
    isCheckedTerm = value!;
    notifyListeners();
  }

  Future<String?> getTerm() async {
    try {
      TermsAndConditionsModel termsAndConditionsModel =
          await DioClient.dioClient.termsAndConditions();
      print(termsAndConditionsModel.toJson().toString());
      return termsAndConditionsModel.description;
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

  //

  List<ChoessCoachModel> coachFromId = [];
  List<TimeList> timeList = [];

  // category
  List<Category1> categoryMain = [];

  Future<String?> getCategory() async {
    try {
      categoryMain = await DioClient.dioClient.getCategory();
      idSelectedCategory = categoryMain.first.id ?? 0;
      getSubCategorysForCategor(categoryMain.first.id ?? 0);
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

// subcategory
  int currentStep = 0;

  addStep() {
    currentStep += 1;
  }

  backStep() {
    currentStep -= 1;
  }

  int idSelectedCategory = 0;
  List<int> subCatId = [];

  List<SubCategory> categorySubforcat = [];
  List<SubCategory> categorySub = [];

  removeIdSub(int index) {
    subCatId.remove(categorySubforcat[index].id);
    notifyListeners();
  }

  addIdSub(int index) {
    subCatId.add(categorySubforcat[index].id ?? 0);
    subCatId.toSet().toList();
    notifyListeners();
  }

  Future<dynamic> getSubCategory() async {
    try {
      categorySub = await DioClient.dioClient.getSubCategory();
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

  Future<dynamic> getSubCategorysForCategor(int id) async {
    try {
      idSelectedCategory = id;
      notifyListeners();
      categorySubforcat = [];
      categorySubforcat =
          await DioClient.dioClient.getSubCategorysForCategor(id);
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

  //Coach Selection

  List<TimeList> listTime = [];

  Map<int, List<TimeList>> timeListMap = {};
  List<List<TimeList>> timeListMain = [];
  List<String> timeListString = [];
  Map<int, String> maptimeListString = {};
  String timeString = '';

  String? selectedTime;
  int idSelectedTime = 0;
  List<int> timeId = [];

  removeIdTime(int index) {
    timeId.remove(index);
    notifyListeners();
  }

  addIdTime(int index) {
    timeId.add(index);
    subCatId.toSet().toList();
    notifyListeners();
  }

  changeTime(TimeList timeOb) {
    notifyListeners();
    categorySubforcat = [];

    String days = '';
    for (ClassDateTimes listvalue in timeOb.classDateTimes ?? []) {
      days += listvalue.dayAsString ?? '';
      days += '/';
    }
    days +=
        '${timeOb.classDateTimes!.first.startClass}->${timeOb.classDateTimes!.first.endClass}';

    timeString = days;
  }

  Future<dynamic> getTimeList(String emailUser, int subCatId) async {
    try {
      listTime = await DioClient.dioClient.getTimeList(emailUser);
      timeListMap[subCatId] = listTime;
      timeListMain.add(listTime);

      print("timeListMain");
      print(timeListMain.toString());
      timeListString = [];
      print(listTime.length);
      for (TimeList value in listTime) {
        String days = '';
        for (ClassDateTimes listvalue in value.classDateTimes ?? []) {
          days += listvalue.dayAsString ?? '';
          days += '/';
        }
        days +=
            '\n${int.parse(value.classDateTimes!.first.startClass!.split(":").first)} ---> ${int.parse(value.classDateTimes!.first.endClass!.split(":").first)}';
        maptimeListString[value.id ?? 0] = days;
        timeListString.add(days);
      }
      print(timeListString.toString());
      notifyListeners();
    } on DioError catch (e) {
      print('e.toString()');
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

  Future<dynamic> getChoesenCoach(List<int> id) async {
    try {
      print(id);
      coachFromId = [];
      coachFromId = await DioClient.dioClient.getSendSubId(id);
      await getTimeList(coachFromId.first.coaches!.first.email ?? '', id.first);
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

  sendClassTime(List<int> id) async {
    try {
      print(id);
      await DioClient.dioClient.sendClassId(id);
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

  //Disease
  List<DiseaseModel> diseases = [];
  List<int> diseasesId = [];

  removediseasesId(int index) {
    diseasesId.remove(diseases[index].id);
    notifyListeners();
  }

  adddiseasesId(int index) {
    diseasesId.add(diseases[index].id ?? 0);
    diseasesId.toSet().toList();
    notifyListeners();
  }

  sendDiseasesId(List<int> id) async {
    try {
      print(id);
      await DioClient.dioClient.sendDiseases(id);
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

  Future<String?> getDisease() async {
    try {
      diseases = await DioClient.dioClient.getDisease();
      print(diseases.length);
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

  // offer

  List<bool> offerSelected = [];

  isSelectedChange(int select) {
    offerSelected = List.filled(offerSelected.length, false);
    offerSelected[select] = true;
    notifyListeners();
  }

  List<SubscriptionModel> offerSub = [];

  Future<String?> getOffer() async {
    try {
      offerSub = await DioClient.dioClient.getOffer();
      print(offerSub.length);
      offerSelected = List.filled(offerSub.length, false);
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

  sendOfferId(int Id) async {
    try {
      return await DioClient.dioClient.sendOfferId(Id);
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

  //  Signup Part 2

  bool isChecked = false;

  changeIsChecked(bool? value) {
    isChecked = value!;
    notifyListeners();
  }

  // late String dropdownValue = timeList.first;
  bool isDiseases = true;

  bool isSubscriptionType = false;
  bool isSelectedOne = false;
  bool isSelectedTwo = false;
  bool isSelectedThree = false;

  makeIsDiseasesTrue() {
    isDiseases = true;
    notifyListeners();
  }

  makeIsDiseasesFalse() {
    isDiseases = false;
    notifyListeners();
  }

  //ForgetPassword

  TextEditingController emailSendCodeController = TextEditingController();
  TextEditingController sendCodeController = TextEditingController();
  TextEditingController sendCodeConfController = TextEditingController();
  bool hideNewPasswordForget = true;
  bool hideConfirmPasswordForget = true;

  changeHideNewPasswordForget() {
    hideNewPasswordForget = !hideNewPasswordForget;
    notifyListeners();
  }

  changeHideConfirmPasswordForget() {
    hideConfirmPasswordForget = !hideConfirmPasswordForget;
    notifyListeners();
  }

  Future<String?> resetSendCode() async {
    try {
      ResponsMassageCode? success = await DioClient.dioClient
          .resetSendCode(emailSendCodeController.text.trim());
      if (success!.message != null) {
        notifyListeners();
        return 'true';
      } else {
        return 'false';
      }
    } on DioError catch (e) {
      notifyListeners();
      print(e.response?.data['message'].toString());
      return e.response?.data['message'].toString();
    }
  }

  Future<String?> verifyResetSendCode() async {
    try {
      ResponsMassageCode? success = await DioClient.dioClient
          .verifyResetSendCode(
              emailSendCodeController.text.trim(), sendCodeController.text);
      if (success!.message != null) {
        notifyListeners();
        return 'true';
      }
    } on DioError catch (e) {
      notifyListeners();
      return e.response?.data['errorList'].toString();
    }
    return null;
  }

  Future<String?> sendEmailConfirmation(String email, String code) async {
    try {
      ResponsMassageCode? success =
          await DioClient.dioClient.sendEmailConfirmation(email, code);
      if (success!.message != null) {
        notifyListeners();
        return 'true';
      }
    } on DioError catch (e) {
      notifyListeners();
      return e.response?.data['message'].toString();
    }
    return null;
  }

  Future<String?> resetPassword(String pass, String conPass) async {
    try {
      print(emailSendCodeController.text.trim());
      ResponsMassageCode? success = await DioClient.dioClient
          .resetPassword(emailSendCodeController.text.trim(), pass, conPass);

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

  bool firstTime = true;

  changeFirstTime(bool value) {
    firstTime = value;
    notifyListeners();
  }

  logOut() {
    getIt<SharedPreferenceHelper>().setIsLogin(isLogint: false);
    getIt<SharedPreferenceHelper>().setUserToken(userToken: '');
    clearAllData();
  }

  clearAllData() {
    getIt<AuthProvider>().listTime = [];

    getIt<AuthProvider>().coachFromId = []; // نشطة
    getIt<AuthProvider>().offerSub = []; //مغلقة
    getIt<AuthProvider>().offerSelected = []; //مسودة
    getIt<AuthProvider>().diseases = [];
    getIt<AuthProvider>().timeId = [];
    getIt<AuthProvider>().timeListString = [];
    getIt<AuthProvider>().timeListMain = [];
    getIt<AuthProvider>().categorySubforcat = [];
    getIt<AuthProvider>().subCatId = [];
    getIt<AuthProvider>().categorySub = [];
    getIt<AuthProvider>().categoryMain = [];

    getIt<AppProvider>().complaintReplay = [];
    getIt<AppProvider>().orderReplay = [];
    getIt<AppProvider>().classTime = [];
  }

  getAllData() {
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
    getIt<AppProvider>().orderReplay;
    getIt<AppProvider>().classTime;
  }
}

// Validator
extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^([a-zA-Z0-9]+)([\-\_\.]*)([a-zA-Z0-9]*)([@])([a-zA-Z0-9]{2,})([\.][a-zA-Z]{2,3}$)')
        .hasMatch(this);
  }

  bool isValidPassword() {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(this);
  }

  bool isValidName() {
    return RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
        .hasMatch(this);
  }

  bool isValidPhone() {
    return RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(this);
  }
}

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}
