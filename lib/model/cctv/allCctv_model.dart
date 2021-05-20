// To parse this JSON data, do
//
//     final allCctvModel = allCctvModelFromJson(jsonString);

import 'dart:convert';

AllCctvModel allCctvModelFromJson(String str) => AllCctvModel.fromJson(json.decode(str));

String allCctvModelToJson(AllCctvModel data) => json.encode(data.toJson());

class AllCctvModel {
    AllCctvModel({
        this.success,
        this.data,
    });

    bool success;
    List<Datum> data;

    factory AllCctvModel.fromJson(Map<String, dynamic> json) => AllCctvModel(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.ipPort,
        this.user,
        this.password,
        this.status,
        this.socket,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    String ipPort;
    String user;
    String password;
    int status;
    String socket;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        ipPort: json["ip_port"] == null ? null : json["ip_port"],
        user: json["user"] == null ? null : json["user"],
        password: json["password"] == null ? null : json["password"],
        status: json["status"] == null ? null : json["status"],
        socket: json["socket"] == null ? null : json["socket"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "ip_port": ipPort == null ? null : ipPort,
        "user": user == null ? null : user,
        "password": password == null ? null : password,
        "status": status == null ? null : status,
        "socket": socket == null ? null : socket,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
