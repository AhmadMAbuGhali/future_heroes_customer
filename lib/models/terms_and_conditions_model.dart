import 'dart:ui';

import 'package:future_heroes_customer/resources/strings_manager.dart';
import 'package:get/get.dart';

import '../main.dart';

class TermsAndConditionsModel {
  String? description;


  TermsAndConditionsModel(
      {this.description,
    });

  TermsAndConditionsModel.fromJson(Map<String, dynamic> json) {
    if(shaedpref.getString("curruntLang") == AppStrings.ar)
    description = json['description'];
   else
    description = json['descriptionEN'];
    //Multi Excerption ar/en

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;

    return data;
  }
}
