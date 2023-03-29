class ProfileData {
  String? imageString;
  String? email;
  String? fullName;
  String? dateOfBirth;
  String? phoneNumber;
  String? endDate;
  int? remainingPostponements;
  String? membershipNo;

  ProfileData(
      {this.imageString,
        this.email,
        this.fullName,
        this.dateOfBirth,
        this.phoneNumber,
        this.endDate,
        this.remainingPostponements,
        this.membershipNo});

  ProfileData.fromJson(Map<String, dynamic> json) {
    imageString = json['imageString'];
    email = json['email'];
    fullName = json['fullName'];
    dateOfBirth = json['dateOfBirth'];
    phoneNumber = json['phoneNumber'];
    endDate = json['endDate'];
    remainingPostponements = json['remainingPostponements'];
    membershipNo = json['membershipNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageString'] = imageString;
    data['email'] = email;
    data['fullName'] = fullName;
    data['dateOfBirth'] = dateOfBirth;
    data['phoneNumber'] = phoneNumber;
    data['endDate'] = endDate;
    data['remainingPostponements'] = remainingPostponements;
    data['membershipNo'] = membershipNo;
    return data;
  }
}
