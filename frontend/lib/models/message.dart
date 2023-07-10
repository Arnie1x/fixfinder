class Message {
  int? id;
  String? body;
  String? updatedAt;
  String? createdAt;
  int? user;
  int? technician;

  Message(
      {this.id,
      this.body,
      this.updatedAt,
      this.createdAt,
      this.user,
      this.technician});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    user = json['user'];
    technician = json['technician'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['body'] = body;
    // data['updated_at'] = updatedAt;
    // data['created_at'] = createdAt;
    data['user'] = user;
    data['technician'] = technician;
    return data;
  }
}
