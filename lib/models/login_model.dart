class LoginModel {
  String? token;
  DateTime? expiration;
  String? role;
  bool? isActive;


  LoginModel({this.token, this.expiration,this.role,this.isActive});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    if(json['expiration'] !=null){
      expiration=DateTime.parse(json['expiration']);
    }
    role=json["role"];
    isActive=json["isActive"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    data['expiration'] = expiration;
    data["role"]= role;
    data["isActive"]= isActive;
    return data;
  }
}
