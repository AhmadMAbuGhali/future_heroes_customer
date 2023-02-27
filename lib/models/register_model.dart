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
    if(json['DateOfBirth'] !=null){
      dateOfBirth=DateTime.parse(json['DateOfBirth']);
    }
    phoneNumber = json['PhoneNumber'];
    email = json['Email'];
    password = json['Password'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ImageFile'] = this.imageFile;
    data['FullName'] = this.fullName;
    data['DateOfBirth'] = this.dateOfBirth;
    data['PhoneNumber'] = this.phoneNumber;
    data['Email'] = this.email;
    data['Password'] = this.password;

    return data;
  }
}
