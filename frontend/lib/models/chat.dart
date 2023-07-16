class Chat {
  int? id;
  int? user_1;
  int? user_2;
  String? updatedAt;
  String? createdAt;

  Chat({this.user_1, this.user_2, this.updatedAt, this.createdAt});

  Chat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_1 = json['user_1'];
    user_2 = json['user_2'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_1'] = user_1;
    // data['updated_at'] = updatedAt;
    // data['created_at'] = createdAt;
    data['user_2'] = user_2;
    return data;
  }
}
