class SubCategory {
  String? name;
  int? categoryId;

  int? id;
  String? createdAt;


  SubCategory(
      {this.name,
        this.categoryId,

        this.id,
        this.createdAt,
      });

  SubCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    categoryId = json['categoryId'];

    id = json['id'];
    createdAt = json['createdAt'];
   }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['categoryId'] = categoryId;

    data['id'] = id;
    data['createdAt'] = createdAt;
     return data;
  }
}
