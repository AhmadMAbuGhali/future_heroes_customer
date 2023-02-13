import 'package:flutter/material.dart';
import 'package:future_heroes_customer/data/OfferResponce.dart';
import 'package:future_heroes_customer/helper/http_helper.dart';
import 'package:get/get.dart';
import 'package:string_validator/string_validator.dart';

class CutomerGetx extends GetNotifier {
  nullValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Required field";
    }
  }

  String? validatorEmail(String v) {
    if (!isEmail(v)) {
      return 'Email error';
    }
  }

  String? validatorName(String v) {
    if (v.length < 3) {
      return 'The name must contain at least 3 characters.';
    }
  }

  String? validatorPassword(String v) {
    if (v.length < 6) {
      return 'Password must be at least 6 characters';
    }
  }

  List<OfferResponce> Offers = [];
  CutomerGetx() : super(null) {
    getAllOffers();
    notifyChildrens();
  }
  getAllOffers() async {
    Offers = await GetOffers.getOffers.GetAllOffers();
    notifyChildrens();
  }
}
