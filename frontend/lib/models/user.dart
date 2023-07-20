class User {
  int? id;
  String? password;
  String? lastLogin;
  bool? isSuperuser;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  bool? isStaff;
  bool? isActive;
  String? dateJoined;
  List<dynamic>? groups;
  List<dynamic>? userPermissions;

  User(
      {this.id,
      this.password,
      this.lastLogin,
      this.isSuperuser,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.isStaff,
      this.isActive,
      this.dateJoined,
      this.groups,
      this.userPermissions});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    lastLogin = json['last_login'];
    isSuperuser = json['is_superuser'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    isStaff = json['is_staff'];
    isActive = json['is_active'];
    dateJoined = json['date_joined'];
    if (json['groups'] != null) {
      groups = <dynamic>[];
      json['groups'].forEach((v) {
        groups!.add(v.fromJson(v));
      });
    }
    if (json['user_permissions'] != null) {
      userPermissions = <dynamic>[];
      json['user_permissions'].forEach((v) {
        userPermissions!.add(v.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['password'] = password;
    data['last_login'] = lastLogin;
    data['is_superuser'] = isSuperuser;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['is_staff'] = isStaff;
    data['is_active'] = isActive;
    data['date_joined'] = dateJoined;
    if (groups != null) {
      data['groups'] = groups!.map((v) => v.toJson()).toList();
    }
    if (userPermissions != null) {
      data['user_permissions'] =
          userPermissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
