// To parse this JSON data, do
//
//     final allUserModel = allUserModelFromJson(jsonString);

import 'dart:convert';

AllUserModel allUserModelFromJson(String str) => AllUserModel.fromJson(json.decode(str));

String allUserModelToJson(AllUserModel data) => json.encode(data.toJson());

class AllUserModel {
    AllUserModel({
        this.sccess,
        this.alluser,
    });

    bool sccess;
    List<Alluser> alluser;

    factory AllUserModel.fromJson(Map<String, dynamic> json) => AllUserModel(
        sccess: json["sccess"] == null ? null : json["sccess"],
        alluser: json["alluser"] == null ? null : List<Alluser>.from(json["alluser"].map((x) => Alluser.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sccess": sccess == null ? null : sccess,
        "alluser": alluser == null ? null : List<dynamic>.from(alluser.map((x) => x.toJson())),
    };
}

class Alluser {
    Alluser({
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

    factory Alluser.fromJson(Map<String, dynamic> json) => Alluser(
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
