class SubscriptionModel {
  String? name;
  String? description;
  dynamic price;
  dynamic duration;

  dynamic id;


  SubscriptionModel(
      {this.name,
        this.description,
        this.price,
        this.duration,

        this.id,
     });

  SubscriptionModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    duration = json['duration'];

    id = json['id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['duration'] = this.duration;
    data['id'] = this.id;

    return data;
  }
}
