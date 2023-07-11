class Technician {
  int? id;
  String? name;
  String? description;
  String? location;
  String? services;
  String? updatedAt;
  String? createdAt;
  int? user;

  Technician(
      {this.id,
      this.name,
      this.description,
      this.location,
      this.services,
      this.updatedAt,
      this.createdAt,
      this.user});

  Technician.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    location = json['location'];
    services = json['services'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['location'] = location;
    data['services'] = services;
    // data['updated_at'] = updatedAt;
    // data['created_at'] = createdAt;
    data['user'] = user;
    return data;
  }
}
