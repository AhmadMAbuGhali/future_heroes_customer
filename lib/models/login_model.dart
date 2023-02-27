class LoginModel {
  String? token;
  DateTime? expiration;
  String? role;


  LoginModel({this.token, this.expiration,this.role});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    if(json['expiration'] !=null){
      expiration=DateTime.parse(json['expiration']);
    }
    role=json["role"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    data['expiration'] = expiration;
    data["role"]= role;
    return data;
  }
}
