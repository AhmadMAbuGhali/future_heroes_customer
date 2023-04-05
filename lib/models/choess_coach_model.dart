class ChoessCoachModel {
  String? subCategoryName;
  int? subCategoryId;
  List<Coaches>? coaches;

  ChoessCoachModel({this.subCategoryName, this.subCategoryId, this.coaches});

  ChoessCoachModel.fromJson(Map<String, dynamic> json) {
    subCategoryName = json['subCategoryName'];
    subCategoryId = json['subCategoryId'];
    if (json['coaches'] != null) {
      coaches = <Coaches>[];
      json['coaches'].forEach((v) {
        coaches!.add(new Coaches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subCategoryName'] = subCategoryName;
    data['subCategoryId'] = subCategoryId;
    if (coaches != null) {
      data['coaches'] = coaches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coaches {
  String? email;
  String? imageString;
  String? fullName;
  String? subCategoryId;

  Coaches({this.email, this.imageString, this.fullName, this.subCategoryId});

  Coaches.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    imageString = json['imageString'];
    fullName = json['fullName'];
    subCategoryId = json['subCategoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['imageString'] = imageString;
    data['fullName'] = fullName;
    data['subCategoryId'] = subCategoryId;
    return data;
  }
}

