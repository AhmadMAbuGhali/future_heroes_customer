class Category1 {
  String? name;
  // List<Null>? subCategories;
  int? id;
  String? createdAt;


  Category1(
      {this.name, this.id, this.createdAt});

  Category1.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    // if (json['subCategories'] != null) {
    //   // subCategories = <Null>[];
    //   json['subCategories'].forEach((v) {
    //     subCategories!.add(Null.fromJson(v));
    //   });
    // }
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    // if (subCategories != null) {
    //   data['subCategories'] =
    //       subCategories!.map((v) => v.toJson()).toList();
    // }
    data['id'] = id;
    data['createdAt'] = createdAt;

    return data;
  }
}
