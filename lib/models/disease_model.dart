import 'dart:ui';

import 'package:future_heroes_customer/resources/strings_manager.dart';
import 'package:get/get.dart';

import '../main.dart';

class DiseaseModel {
  String? name;


  DiseaseModel(
      {this.name,
      });

  DiseaseModel.fromJson(Map<String, dynamic> json) {
    if(shaedpref.getString("curruntLang") == AppStrings.ar)
      name = json['name'];
    else
      name = json['nameEN'];
    //Multi Excerption ar/en

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;

    return data;
  }
}
