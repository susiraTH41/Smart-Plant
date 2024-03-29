// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.success,
        this.userinfo,
        this.msg,
    });

    bool success;
    Userinfo userinfo;
    String msg;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"] == null ? null : json["success"],
        userinfo: json["userinfo"] == null ? null : Userinfo.fromJson(json["userinfo"]),
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "userinfo": userinfo == null ? null : userinfo.toJson(),
        "msg": msg == null ? null : msg,
    };
}

class Userinfo {
    Userinfo({
        this.id,
        this.prefix,
        this.rank,
        this.email,
        this.password,
        this.firstName,
        this.lastName,
        this.isAdmin,
        this.useLine,
        this.lineToken,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    int prefix;
    String rank;
    String email;
    String password;
    String firstName;
    String lastName;
    int isAdmin;
    int useLine;
    String lineToken;
    DateTime createdAt;
    DateTime updatedAt;

    factory Userinfo.fromJson(Map<String, dynamic> json) => Userinfo(
        id: json["id"] == null ? null : json["id"],
        prefix: json["prefix"] == null ? null : json["prefix"],
        rank: json["rank"] == null ? null : json["rank"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        isAdmin: json["is_admin"] == null ? null : json["is_admin"],
        useLine: json["use_line"] == null ? null : json["use_line"],
        lineToken: json["line_token"] == null ? null : json["line_token"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "prefix": prefix == null ? null : prefix,
        "rank": rank == null ? null : rank,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "is_admin": isAdmin == null ? null : isAdmin,
        "use_line": useLine == null ? null : useLine,
        "line_token": lineToken == null ? null : lineToken,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
