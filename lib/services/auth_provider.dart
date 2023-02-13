
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/data/api/dio_client.dart';
import 'package:future_heroes_customer/data/api/exception_handling.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/CustomButtonPrimary.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider();
  bool hidePass = true;
  bool rememberMe = false;
  File? imageFile;
  bool isChecked = false;
  bool isCultural = false;
  List<String> list = <String>[
    '04:00 - 05:00',
    '01:00 - 02:00',
    '03:00 - 04:00',
  ];
  bool isCoachSelection = false;
  String dropdownValue = "choseTime".tr;
  bool isDiseases = true;

  bool isSubscriptionType = false;
  bool isSelectedOne = false;
  bool isSelectedTwo = false;
  bool isSelectedThree = false;
  var price1 = 99.99;
  var price2 = 179.99;
  var price3 = 249.99;



  selectOne(){
    isSelectedOne = true;
    isSelectedTwo = false;
    isSelectedThree = false;
    notifyListeners();

  }
  selectTow(){
    isSelectedOne = false;
    isSelectedTwo = true;
    isSelectedThree = false;
    notifyListeners();

  }
  selectThree(){
    isSelectedOne = false;
    isSelectedTwo = false;
    isSelectedThree = true;
    notifyListeners();

  }






  final List<String> items = [
    '04:00 - 05:00 ',
    '01:00 - 02:00 ',
    '03:00 - 04:00 ',
  ];
  String? selectedValue;
  makeCulturalTrue(){
     isCultural = true;
    notifyListeners();

  }
  makeCulturalFalse(){
     isCultural = false;
    notifyListeners();

  }
  makeIsDiseasesTrue(){
    isDiseases = true;
    notifyListeners();

  }
  makeIsDiseasesFalse(){
    isDiseases = false;
    notifyListeners();

  }
  makeCoachSelectionTrue(){
    isCoachSelection  = true;
    notifyListeners();

  }
  makeCoachSelectionFalse(){
    isCoachSelection = false;
    notifyListeners();

  }

  TextEditingController dateTextInput = TextEditingController();

  showDateText(String date){
    dateTextInput.text = date;
    notifyListeners();
  }

  showDropdownValue(String? date){
    dropdownValue = date!;
    notifyListeners();
  }


  changeHidePass(){
    hidePass=!hidePass;
    notifyListeners();
  }

  changeRememberMe(){
    rememberMe=!rememberMe;
    notifyListeners();
  }

  changeIsChecked(bool? value){
    isChecked=value!;
    notifyListeners();
  }
  login(String userName,String password) async {
    try{
      bool? respontLogin = await DioClient.dioClient.login(userName, password);
    }on DioError catch(e){
      String massage=DioException.fromDioError(e).toString();
      final snackBar = SnackBar(
        content: SizedBox(
            height: 32.h,
            child:   Center(
                child: Text(massage ))),
        backgroundColor: ColorManager.red,
        behavior: SnackBarBehavior.floating,
        width: 300.w,
        duration: const Duration(seconds: 1),
      );

    }
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

  openCamera(){
    _getFromCamera();
    Navigator.pop(context);
  }
  openGallery(){
    _getFromGallery();
    Navigator.pop(context);
  }
  Widget bottomSheet() {
    return Container(
      decoration:
      BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
      height: 220.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'changePhoto'.tr,
          ),
          SizedBox(
            height: 8.h,
          ),
          CustomButtonPrimary(
              text: "openCamera".tr,
              onpressed: () {
               openCamera();
              }),
          SizedBox(height: 10.h,),
          Text("or".tr),
          CustomButtonPrimary(
              text: "openGallery".tr,
              onpressed: () {
                openGallery();
              }),
        ],
      ),
    );
  }
}
