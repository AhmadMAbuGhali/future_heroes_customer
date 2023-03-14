import 'dart:io';

import 'package:dio/dio.dart';
import 'package:future_heroes_customer/data/api/apiconst.dart';
import 'package:future_heroes_customer/main.dart';
import 'package:future_heroes_customer/models/category.dart';
import 'package:future_heroes_customer/models/choess_coach_model.dart';
import 'package:future_heroes_customer/models/disease_model.dart';
import 'package:future_heroes_customer/models/login_model.dart';
import 'package:future_heroes_customer/models/register_model.dart';
import 'package:future_heroes_customer/models/sub_category.dart';
import 'package:future_heroes_customer/models/subscribtion_model.dart';
import 'package:future_heroes_customer/models/terms_and_conditions_model.dart';
import 'package:future_heroes_customer/models/time_list.dart';

import '../../models/respons_massage_code.dart';

class DioClient {
  DioClient._() {
    initDio();
  }

  static final DioClient dioClient = DioClient._();
  Dio? dio;

  initDio() {
    dio = Dio();
    dio?.options.baseUrl = ApiConstant.baseUrl;
  }

  Future<LoginModel?> login(String email, String password) async {
    Response response = await dio!
        .post(ApiConstant.login, data: {"email": email, "password": password});
    LoginModel user = LoginModel.fromJson(response.data);
    if (user.role == "User") {
      return user;
    } else {
      return null;
    }
  }


  Future<RegisterModel?> register( File image,String fullName, DateTime dob,
      String phoneNumber, String email, String password) async {

    FormData formData = FormData.fromMap({
      "ImageFile":image.path,
      "FullName": fullName,
      "DateOfBirth": dob.toIso8601String(),
      "PhoneNumber": phoneNumber,
      "Password": password,
      "Email": email,
    });
    Response response = await dio!.post(ApiConstant.register, data: formData);
    print('response.statusCode');
    print(response.data);
    RegisterModel registerUser = RegisterModel.fromJson(response.data);

    return registerUser;

  }

  Future<TermsAndConditionsModel> termsAndConditions() async {
    Response response = await dio!.get(ApiConstant.termsAndConditions,
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang")
          },)
    );
    TermsAndConditionsModel term =
    TermsAndConditionsModel.fromJson(response.data[0]);
    return term;
  }

  //////////////////

  Future<List<Category1>> getCategory() async {
    Response response = await dio!.get(ApiConstant.category,
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang")
          },)
    );
    List<Category1> listcat=[];
    listcat= (response.data as List).map((e) => Category1.fromJson(e)).toList();

    return listcat;
  }
  //////////////////
  Future<List<TimeList>> getTimeList(String emailUser) async {
    Response response = await dio!.get(ApiConstant.timeList,
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang")
          },),
      queryParameters: {
      "userEmail":emailUser
      }
    );
    List<TimeList> listcat=[];
    listcat= (response.data as List).map((e) => TimeList.fromJson(e)).toList();
    print(listcat.toString());
    return listcat;
  }
  Future<List<SubCategory>> getSubCategory() async {
    Response response = await dio!.get(ApiConstant.subCategory,
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang")
          },)
    );
    List<SubCategory> listcat=[];
    listcat= (response.data as List).map((e) => SubCategory.fromJson(e)).toList();

    return listcat;
  }
  Future<List<SubCategory>> getSubCategorysForCategor(int id) async {
    Response response = await dio!.get(ApiConstant.getSubCategorysForCategor,
        queryParameters: {
          "id":id
        },
        options: Options(

          headers: {
            "Accept-Language": shaedpref.getString("curruntLang")

          },)
    );
    List<SubCategory> listsubcatforcat=[];
    listsubcatforcat= (response.data as List).map((e) => SubCategory.fromJson(e)).toList();

    return listsubcatforcat;
  }
///////////
  Future<List<ChoessCoachModel>> getSendSubId(List<int> id) async {
    Response response = await dio!.post(ApiConstant.sendSubId,
        data: id,
        options: Options(

          headers: {
            "Accept-Language": shaedpref.getString("curruntLang")

          },)
    );
    List<ChoessCoachModel> listChoessCoach=[];
    listChoessCoach= (response.data as List).map((e) => ChoessCoachModel.fromJson(e)).toList();
    print(response.data.toString());

    return listChoessCoach;
  }

  /////
  Future<List<DiseaseModel>> getDisease() async {
    Response response = await dio!.get(ApiConstant.disease,
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang")
          },)
    );
    List<DiseaseModel> listDisease=[];
    listDisease= (response.data as List).map((e) => DiseaseModel.fromJson(e)).toList();
    print(listDisease.length);

    return listDisease;
  }

  Future<List<SubscriptionModel>> getOffer() async {
    Response response = await dio!.get(ApiConstant.offer,
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang")
          },)
    );
    List<SubscriptionModel> listOffer=[];
    listOffer= (response.data as List).map((e) => SubscriptionModel.fromJson(e)).toList();

    return listOffer;
  }



  Future<ResponsMassageCode?> resetSendCode(String email) async {
    Response response =
    await dio!.post(ApiConstant.forgetPassword, queryParameters: {"email": email});
    ResponsMassageCode responseMassage =
    ResponsMassageCode.fromJson(response.data);
    return responseMassage;
  }

  Future<ResponsMassageCode?> verifyResetSendCode(
      String email, String code) async {
    Response response = await dio!.post(ApiConstant.confirmCode,
        data: {"email": email, "code": code});
    ResponsMassageCode responseMassage =
    ResponsMassageCode.fromJson(response.data);
    return responseMassage;
  }

  Future<ResponsMassageCode?> resetPassword(
      String email, String password, String confirmPassword) async {
    Response response = await dio!.put(ApiConstant.resetPassword,
        data: {"email": email, "password": password, "confirmPassword": confirmPassword});
    ResponsMassageCode responseMassage =
    ResponsMassageCode.fromJson(response.data);
    return responseMassage;
  }

}

