// ignore_for_file: prefer_null_aware_operators

import 'dart:io';

class RegisterModel {
  String? email;
  String? password;

  File? imageFile;
  String? fullName;
  DateTime? dateOfBirth;
  String? phoneNumber;

  RegisterModel({this.imageFile, this.fullName,this.dateOfBirth,this.phoneNumber,this.password,this.email});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    imageFile = json['ImageFile'];
    fullName = json['FullName'];

    // if(json['DateOfBirth'] !=null){
    //   dateOfBirth=DateTime.parse(json['DateOfBirth']);
    // }

    dateOfBirth = json["DateOfBirth"] == null ? null : DateTime.parse(json["DateOfBirth"]);


    phoneNumber = json['PhoneNumber'];
    email = json['Email'];
    password = json['Password'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ImageFile'] = imageFile;
    data['FullName'] = fullName;
    data['DateOfBirth'] = dateOfBirth == null ? null : dateOfBirth?.toIso8601String();
    data['PhoneNumber'] = phoneNumber;
    data['Email'] = email;
    data['Password'] = password;

    return data;
  }
}
