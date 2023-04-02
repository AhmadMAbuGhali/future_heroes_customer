class OffersModel {
  String? name;
  String? description;
  int? id;
  String? createdAt;


  OffersModel(
      {this.name, this.description, this.id, this.createdAt});

  OffersModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    id = json['id'];
    createdAt = json['createdAt'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['description'] = description;
    data['id'] = id;
    data['createdAt'] = createdAt;
    return data;
  }
}
