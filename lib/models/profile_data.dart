class ProfileData {
  String? imageString;
  String? email;
  String? fullName;
  String? dateOfBirth;
  String? phoneNumber;

  ProfileData(
      {this.imageString,
        this.email,
        this.fullName,
        this.dateOfBirth,
        this.phoneNumber});

  ProfileData.fromJson(Map<String, dynamic> json) {
    imageString = json['imageString'];
    email = json['email'];
    fullName = json['fullName'];
    dateOfBirth = json['dateOfBirth'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageString'] = imageString;
    data['email'] = email;
    data['fullName'] = fullName;
    data['dateOfBirth'] = dateOfBirth;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
