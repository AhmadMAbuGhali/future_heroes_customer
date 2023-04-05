
class TermsAndConditionsModel {
  String? description;


  TermsAndConditionsModel(
      {this.description,
    });

  TermsAndConditionsModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
}
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = description;

    return data;
  }
}
