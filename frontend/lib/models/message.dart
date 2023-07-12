class Message {
  int? chat;
  int? author;
  String? body;
  String? updatedAt;
  String? createdAt;

  Message({this.chat, this.author, this.body, this.updatedAt, this.createdAt});

  Message.fromJson(Map<String, dynamic> json) {
    chat = json['chat'];
    author = json['author'];
    body = json['body'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['chat'] = chat;
    data['author'] = author;
    data['body'] = body;
    // data['updated_at'] = updatedAt;
    // data['created_at'] = createdAt;
    return data;
  }
}
