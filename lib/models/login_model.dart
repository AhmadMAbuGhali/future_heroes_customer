class LoginModel {
  String? token;
  DateTime? expiration;

  LoginModel({this.token, this.expiration});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    if(json['expiration'] !=null){
      expiration=DateTime.parse(json['expiration']);
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expiration'] = this.expiration;
    return data;
  }
}
