class ComplaintReplay {
  String? title;
  String? subject;
  String? respone;
  int? id;
  String? createdAt;


  ComplaintReplay(
      {this.title,
        this.subject,
        this.respone,
        this.id,
        this.createdAt,
       });

  ComplaintReplay.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subject = json['subject'];
    respone = json['respone'];
    id = json['id'];
    createdAt = json['createdAt'];
    ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['subject'] = subject;
    data['respone'] = respone;
    data['id'] = id;
    data['createdAt'] = createdAt;

    return data;
  }
}
