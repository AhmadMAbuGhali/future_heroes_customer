import 'dart:io';

class CompleteProfileModel {
  File? imageFile;
  String? fullName;
  DateTime? dateOfBirth;
  String? phoneNumber;

  CompleteProfileModel({this.imageFile, this.fullName,this.dateOfBirth,this.phoneNumber});

  // CompleteProfileModel.fromJson(Map<String, dynamic> json) {
  //   imageFile = json['ImageFile'];
  //   fullName = json['FullName'];
  //   if(json['DateOfBirth'] !=null){
  //     dateOfBirth=DateTime.parse(json['DateOfBirth']);
  //   }
  //   phoneNumber = json['PhoneNumber'];
  //
  //
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['ImageFile'] = this.imageFile;
  //   data['FullName'] = this.fullName;
  //   data['DateOfBirth'] = this.dateOfBirth;
  //   data['PhoneNumber'] = this.phoneNumber;
  //
  //   return data;
  // }
}
