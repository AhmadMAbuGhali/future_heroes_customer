class OfferResponce {
  String? name;
  String? nameEN;
  String? description;
  String? descriptionEN;
  int? price;
  Null? status;
  int? id;
  String? createdAt;
  String? updatedAt;

  OfferResponce(
      {this.name,
      this.nameEN,
      this.description,
      this.descriptionEN,
      this.price,
      this.status,
      this.id,
      this.createdAt,
      this.updatedAt});

  OfferResponce.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nameEN = json['nameEN'];
    description = json['description'];
    descriptionEN = json['descriptionEN'];
    price = json['price'];
    status = json['status'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['nameEN'] = this.nameEN;
    data['description'] = this.description;
    data['descriptionEN'] = this.descriptionEN;
    data['price'] = this.price;
    data['status'] = this.status;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
