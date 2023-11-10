import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  String username;
  String email;
  String password;
  //DateTime createdAt;
  int createdAt;

  UserModel({
    this.id = "",
    this.username = "",
    this.email = "",
    this.password = "",
    // TODO: create timestamp
    //this.createdAt = DateTime.now().millisecondsSinceEpoch,
    this.createdAt = 1695617203,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    //"password": password,
    "created_at": createdAt,
  };
}