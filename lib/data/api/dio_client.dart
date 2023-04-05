// ignore_for_file: empty_catches

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:future_heroes_customer/data/api/apiconst.dart';
import 'package:future_heroes_customer/main.dart';
import 'package:future_heroes_customer/models/category.dart';
import 'package:future_heroes_customer/models/choess_coach_model.dart';
import 'package:future_heroes_customer/models/class_time_model.dart';
import 'package:future_heroes_customer/models/complaint_replay.dart';
import 'package:future_heroes_customer/models/disease_model.dart';
import 'package:future_heroes_customer/models/is_active.dart';
import 'package:future_heroes_customer/models/login_model.dart';
import 'package:future_heroes_customer/models/notification_model.dart';
import 'package:future_heroes_customer/models/order_replay.dart';
import 'package:future_heroes_customer/models/profile_data.dart';
import 'package:future_heroes_customer/models/register_model.dart';
import 'package:future_heroes_customer/models/sub_category.dart';
import 'package:future_heroes_customer/models/subscribtion_model.dart';
import 'package:future_heroes_customer/models/terms_and_conditions_model.dart';
import 'package:future_heroes_customer/models/time_list.dart';
import '../../models/offer_model.dart';
import '../../models/respons_massage_code.dart';
import '../../services/shared_preference_helper.dart';

class DioClient {
  DioClient._() {
    initDio();
  }

  // initDio
  static final DioClient dioClient = DioClient._();
  Dio? dio;

  initDio() {
    dio = Dio();
    dio?.options.baseUrl = ApiConstant.baseUrl;
  }

// Login
  Future<LoginModel?> login(String email, String password) async {
    try {
      Response response = await dio!.post(ApiConstant.login,
          data: {"email": email, "password": password});
      LoginModel user = LoginModel.fromJson(response.data);
      if (user.role == "User") {
        return user;
      } else {
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }

// register
  Future<RegisterModel?> register(File image, String fullName, DateTime dob,
      String phoneNumber, String email, String password) async {
    FormData formData = FormData.fromMap({
      "ImageFile":
          await MultipartFile.fromFile(image.path, filename: image.path),
      "FullName": fullName,
      "DateOfBirth": dob.toIso8601String(),
      "PhoneNumber": phoneNumber,
      "Password": password,
      "Email": email,
    });
    Response response = await dio!.post(ApiConstant.register, data: formData);
    RegisterModel registerUser = RegisterModel.fromJson(response.data);

    return registerUser;
  }

  Future<File?> updateImage(File image) async {
    try {
      FormData formData = FormData.fromMap({
        "ImageFile":
            await MultipartFile.fromFile(image.path, filename: image.path),
      });
      await dio!.put(ApiConstant.updateImageProfile,
          data: formData,
          options: Options(
            headers: {
              "Accept-Language": shaedpref.getString("curruntLang"),
              'Authorization':
                  'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
            },
          ));
    } catch (e) {
    }
    return null;
  }

  // term
  Future<TermsAndConditionsModel> termsAndConditions() async {
    Response response = await dio!.get(ApiConstant.termsAndConditions,
        options: Options(
          headers: {"Accept-Language": shaedpref.getString("curruntLang")},
        ));
    TermsAndConditionsModel term =
        TermsAndConditionsModel.fromJson(response.data[0]);
    return term;
  }

//category

  Future<List<Category1>> getCategory() async {
    Response response = await dio!.get(ApiConstant.category,
        options: Options(
          headers: {"Accept-Language": shaedpref.getString("curruntLang")},
        ));
    List<Category1> listcat = [];
    listcat =
        (response.data as List).map((e) => Category1.fromJson(e)).toList();

    return listcat;
  }

  //subCategory
  Future<List<SubCategory>> getSubCategory() async {
    Response response = await dio!.get(ApiConstant.subCategory,
        options: Options(
          headers: {"Accept-Language": shaedpref.getString("curruntLang")},
        ));
    List<SubCategory> listcat = [];
    listcat =
        (response.data as List).map((e) => SubCategory.fromJson(e)).toList();

    return listcat;
  }

  Future<List<SubCategory>> getSubCategorysForCategor(int id) async {
    Response response = await dio!.get(ApiConstant.getSubCategorysForCategor,
        queryParameters: {"id": id},
        options: Options(
          headers: {"Accept-Language": shaedpref.getString("curruntLang")},
        ));
    List<SubCategory> listsubcatforcat = [];
    listsubcatforcat =
        (response.data as List).map((e) => SubCategory.fromJson(e)).toList();

    return listsubcatforcat;
  }

//Coach Selection
  Future<List<ChoessCoachModel>> getSendSubId(List<int> id) async {
    Response response = await dio!.post(ApiConstant.sendSubId,
        data: id,
        options: Options(
          headers: {"Accept-Language": shaedpref.getString("curruntLang")},
        ));
    List<ChoessCoachModel> listChoessCoach = [];
    listChoessCoach = (response.data as List)
        .map((e) => ChoessCoachModel.fromJson(e))
        .toList();

    return listChoessCoach;
  }

  Future<List<TimeList>> getTimeList(String emailUser) async {
    Response response = await dio!.get(ApiConstant.timeList,
        options: Options(
          headers: {"Accept-Language": shaedpref.getString("curruntLang")},
        ),
        queryParameters: {"userEmail": emailUser});
    List<TimeList> listcat = [];
    listcat = (response.data as List).map((e) => TimeList.fromJson(e)).toList();

    return listcat;
  }

  Future<void> sendClassId(List<int> id) async {
    await dio!.post(ApiConstant.traineeClass,
        data: {"classId": id},
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization':
                'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          },
        ));
  }

  //Disease
  Future<List<DiseaseModel>> getDisease() async {
    Response response = await dio!.get(ApiConstant.disease,
        options: Options(
          headers: {"Accept-Language": shaedpref.getString("curruntLang")},
        ));
    List<DiseaseModel> listDisease = [];
    listDisease =
        (response.data as List).map((e) => DiseaseModel.fromJson(e)).toList();

    return listDisease;
  }

  Future<void> sendDiseases(List<int> id) async {
    await dio!.post(ApiConstant.userDiseases,
        data: {"diseaseId": id},
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization':
                'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          },
        ));
  }

  Future<void> presenceRegistration() async {
    await dio!.put(ApiConstant.presenceRegistration,
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization':
                'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          },
        ));
  }

//Subscription
  Future<List<OffersModel>> getOffer() async {
    Response response = await dio!.get(ApiConstant.getOffers,
        options: Options(
          headers: {"Accept-Language": shaedpref.getString("curruntLang")},
        ));
    List<OffersModel> listOffer = [];
    listOffer =
        (response.data as List).map((e) => OffersModel.fromJson(e)).toList();

    return listOffer;
  }

  Future<List<SubscriptionModel>> getPackages() async {
    Response response = await dio!.get(ApiConstant.getPakages,
        options: Options(
          headers: {"Accept-Language": shaedpref.getString("curruntLang")},
        ));
    List<SubscriptionModel> listPackages = [];
    listPackages = (response.data as List)
        .map((e) => SubscriptionModel.fromJson(e))
        .toList();

    return listPackages;
  }

  Future<void> sendOfferId(int id) async {
    await dio!.post(ApiConstant.userOrder,
        data: {"offerId": id},
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization':
                'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          },
        ));
  }

  //profileData

  Future<ProfileData> getProfileData() async {
    Response response = await dio!.get(ApiConstant.getProfileData,
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization':
                'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          },
        ));

    ProfileData profileData = ProfileData.fromJson(response.data);
    return profileData;
  }

  Future<ResponsMassageCode?> postComplaint(
      String title, String subject) async {
    try {
      await dio!.post(ApiConstant.complaint,
          data: {
            "title": title,
            "subject": subject,
          },
          options: Options(headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization':
                'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          }));
    } on DioError catch (e) {
      if (e.response?.statusCode == 500) {
      }
    }
    return null;
  }

  Future<ResponsMassageCode?> postOrder(String title, String subject) async {
    try {
      await dio!.post(ApiConstant.userOrder,
          data: {"title": title, "subject": subject, "offerId": null},
          options: Options(headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization':
                'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          }));
    } on DioError catch (e) {
      if (e.response?.statusCode == 500) {
      }
    }
    return null;
  }

  Future<ResponsMassageCode?> postUserPostponement(
      int id, String reason, String details) async {
    try {
      await dio!.post(ApiConstant.userPostponement,
          data: {"userPresenceId": id, "reason": reason, "details": details},
          options: Options(headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization':
                'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          }));
    } on DioError catch (e) {
      if (e.response?.statusCode == 500) {
      }
    }
    return null;
  }

  Future<List<ComplaintReplay>> getComplaintReplay() async {
    Response response = await dio!.get(
      ApiConstant.getUserComplaint,
      options: Options(
        headers: {
          "Accept-Language": shaedpref.getString("curruntLang"),
          'Authorization':
              'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
        },
      ),
    );
    List<ComplaintReplay> complaintReplay = [];
    complaintReplay = (response.data as List)
        .map((e) => ComplaintReplay.fromJson(e))
        .toList();
    return complaintReplay;
  }

  Future<List<OrderReplay>> getOrderReplay() async {
    Response response = await dio!.get(
      ApiConstant.getUserOrders,
      options: Options(
        headers: {
          "Accept-Language": shaedpref.getString("curruntLang"),
          'Authorization':
              'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
        },
      ),
    );
    List<OrderReplay> orderReplay = [];
    orderReplay =
        (response.data as List).map((e) => OrderReplay.fromJson(e)).toList();
    return orderReplay;
  }

  Future<List<NotificationModel>> getUserNotification() async {
    Response response = await dio!.get(
      ApiConstant.userNotification,
      options: Options(
        headers: {
          "Accept-Language": shaedpref.getString("curruntLang"),
          'Authorization':
              'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
        },
      ),
    );
    List<NotificationModel> notificationModel = [];
    notificationModel = (response.data as List)
        .map((e) => NotificationModel.fromJson(e))
        .toList();
    return notificationModel;
  }

  Future<IsACtive?> getIsActive() async {
    if (dio == null) {
      throw Exception("Dio instance is null");
    }
    try {
      Response response = await dio!.get(
        ApiConstant.isActiveStatus,
        options: Options(
          headers: {
            "Accept-Language": shaedpref.getString("curruntLang"),
            'Authorization': 'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
          },
        ),
      );
      return IsACtive.fromJson(response.data);
    } catch (e) {
      throw Exception("Error getting isActive status: $e");
    }
  }


  Future<List<ClassTime>> getLecture() async {
    Response response = await dio!.get(
      ApiConstant.getUserPresenceAsync,
      options: Options(
        headers: {
          "Accept-Language": shaedpref.getString("curruntLang"),
          'Authorization':
              'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
        },
      ),
    );
    List<ClassTime> classTime = [];
    classTime =
        (response.data as List).map((e) => ClassTime.fromJson(e)).toList();
    return classTime;
  }

//ForgetPassword
  Future<ResponsMassageCode?> resetSendCode(String email) async {
    Response response = await dio!
        .post(ApiConstant.forgetPassword, queryParameters: {"email": email});
    ResponsMassageCode responseMassage =
        ResponsMassageCode.fromJson(response.data);
    return responseMassage;
  }

  Future<ResponsMassageCode?> verifyResetSendCode(
      String email, String code) async {
    Response response = await dio!
        .post(ApiConstant.confirmCode, data: {"email": email, "code": code});
    ResponsMassageCode responseMassage =
        ResponsMassageCode.fromJson(response.data);
    return responseMassage;
  }

  Future<ResponsMassageCode?> sendEmailConfirmation(
      String email, String code) async {
    Response response = await dio!.put(ApiConstant.sendEmailConfirmation,
        data: {"email": email, "code": code});
    ResponsMassageCode responseMassage =
        ResponsMassageCode.fromJson(response.data);
    return responseMassage;
  }

  Future<ResponsMassageCode?> resetPassword(
      String email, String password, String confirmPassword) async {
    Response response = await dio!.put(ApiConstant.resetPassword, data: {
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword
    });
    ResponsMassageCode responseMassage =
        ResponsMassageCode.fromJson(response.data);
    return responseMassage;
  }

  Future<ResponsMassageCode?> resetPasswordAuthorize(
      String oldPass, String password, String confirmPassword) async {
    try {
      Response response = await dio!.put(
        ApiConstant.resetPasswordAuthorize,
        data: {
          "oldPassword": oldPass,
          "newPassword": password,
          "confirmPassword": confirmPassword
        },
        options: Options(headers: {
          'Authorization':
              'Bearer ${getIt<SharedPreferenceHelper>().getUserToken()}'
        }),
      );

      ResponsMassageCode responseMassage =
          ResponsMassageCode.fromJson(response.data);
      return responseMassage;
    } catch (e) {
    }
    return null;
  }
}
