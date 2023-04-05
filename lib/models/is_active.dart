class IsACtive {
  bool? isActive;

  IsACtive({this.isActive});

  IsACtive.fromJson(Map<String, dynamic> json) {
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isActive'] = isActive;
    return data;
  }
}
