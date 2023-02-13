import 'package:dio/dio.dart';
import 'package:future_heroes_customer/data/api/apiconst.dart';

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
  Future<bool?> login(String userName,String password) async {
    Response response = await dio!.post(
      ApiConstant.login,
      queryParameters: {
        "username":userName,
        "password":password
      }
    );
    // LoginRespons user = LoginRespons.fromJson(response.data);

    return response.data;
  }

}