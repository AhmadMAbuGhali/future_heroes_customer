import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:future_heroes_customer/data/OfferResponce.dart';
import 'package:http/http.dart' as http;

class GetOffers {
  GetOffers._();
  static GetOffers getOffers = GetOffers._();
  OfferResponce? offers;
  Dio dio = Dio();

  Future<List<OfferResponce>> GetAllOffers() async {
    var response = await dio.get(
        'https://yousef.azurewebsites.net//api/Offer?page=1&pageSize=10&searchText=&sortColumn=&sortDirection=ascending');
    List<dynamic> profilesList = response.data;
    List<OfferResponce> Offers = profilesList
        .map((e) => OfferResponce.fromJson(e as Map<String, dynamic>))
        .toList();
    log(response.data.toString());
    return Offers;
  }
}
