import 'dart:io';

import 'package:dio/dio.dart';
import 'package:future_heroes_customer/data/api/apiconst.dart';
import 'package:future_heroes_customer/main.dart';
import 'package:future_heroes_customer/models/disease_model.dart';
import 'package:future_heroes_customer/models/login_model.dart';
import 'package:future_heroes_customer/models/register_model.dart';
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

  Future<DiseaseModel> Disease() async {
    Response response = await dio!.get(ApiConstant.disease);
    DiseaseModel dis = DiseaseModel.fromJson(response.data);
    return dis;
  }
}
