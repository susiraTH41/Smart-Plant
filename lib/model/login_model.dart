import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.success,
        this.userinfo,
    });

    bool success;
    Userinfo userinfo;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"] == null ? null : json["success"],
        userinfo: json["userinfo"] == null ? null : Userinfo.fromJson(json["userinfo"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "userinfo": userinfo == null ? null : userinfo.toJson(),
    };
}

class Userinfo {
    Userinfo({
        this.id,
        this.username,
        this.firstname,
        this.lastname,
        this.password,
        this.email,
        this.isAdmin,
        this.createdAt,
        this.updatedAt,
    });

    String id;
    dynamic username;
    dynamic firstname;
    dynamic lastname;
    String password;
    String email;
    bool isAdmin;
    DateTime createdAt;
    DateTime updatedAt;

    factory Userinfo.fromJson(Map<String, dynamic> json) => Userinfo(
        id: json["id"] == null ? null : json["id"],
        username: json["username"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        password: json["password"] == null ? null : json["password"],
        email: json["email"] == null ? null : json["email"],
        isAdmin: json["is_admin"] == null ? null : json["is_admin"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "username": username,
        "firstname": firstname,
        "lastname": lastname,
        "password": password == null ? null : password,
        "email": email == null ? null : email,
        "is_admin": isAdmin == null ? null : isAdmin,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
