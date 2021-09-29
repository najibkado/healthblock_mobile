// To parse this JSON data, do
//
//     final staff = staffFromJson(jsonString);

import 'dart:convert';

Staff staffFromJson(String str) => Staff.fromJson(json.decode(str));

String staffToJson(Staff data) => json.encode(data.toJson());

class Staff {
  Staff({
    this.userId,
    this.user,
    this.token,
  });

  int userId;
  User user;
  String token;

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        userId: json["user_id"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  User({
    this.id,
    this.username,
    this.email,
  });

  int id;
  String username;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
      };
}
