

class DiseaseModel {
  String? name;
  int? id;


  DiseaseModel(
      {this.name,
        this.id
      });

  DiseaseModel.fromJson(Map<String, dynamic> json) {

      name = json['name'];
      id= json["id"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data["id"]= id;

    return data;
  }
}
