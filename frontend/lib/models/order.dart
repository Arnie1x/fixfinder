class Order {
  int? id;
  int? amount;
  String? state;
  String? updatedAt;
  String? createdAt;
  int? technician;
  int? user;

  Order(
      {this.id,
      this.amount,
      this.state,
      this.updatedAt,
      this.createdAt,
      this.technician,
      this.user});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    state = json['state'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    technician = json['technician'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = this.id;
    data['amount'] = amount;
    data['state'] = state;
    // data['updated_at'] = this.updatedAt;
    // data['created_at'] = this.createdAt;
    data['technician'] = technician;
    data['user'] = user;
    return data;
  }
}
