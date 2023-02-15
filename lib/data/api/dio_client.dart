import 'dart:io';

import 'package:dio/dio.dart';
import 'package:future_heroes_customer/data/api/apiconst.dart';
import 'package:future_heroes_customer/models/login_model.dart';
import 'package:future_heroes_customer/models/terms_and_conditions_model.dart';

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
  Future<LoginModel?> login(String email,String password) async {
    Response response = await dio!.post(
      ApiConstant.login,
    data: {
      "email": email,
      "password": password
    }
    );
     LoginModel user = LoginModel.fromJson(response.data);

    return user;
  }
  Future<LoginModel?> register(String email,String password) async {
    Response response = await dio!.post(
      ApiConstant.register,
    data: {
      "email": email,
      "password": password
    }
    );
    // LoginRespons user = LoginRespons.fromJson(response.data);

    return response.data;
  }
  Future<String?> completeProfile(File image,String fullName,DateTime dob,String phoneNumber) async {
    FormData formData = FormData.fromMap({
      "ImageFile": await MultipartFile.fromFile(image.path),
      "FullName": fullName,
      "DateOfBirth": dob,
      "PhoneNumber": phoneNumber,
    });
    Response response = await dio!.post(
      ApiConstant.completeProfile,
    data: formData
    );

    return response.data['message'];
  }



  Future<TermsAndConditionsModel> termsAndConditions() async {
    Response response = await dio!.get(ApiConstant.termsAndConditions
    );
    TermsAndConditionsModel term = TermsAndConditionsModel.fromJson(response.data[0]);
    return term;
  }



}