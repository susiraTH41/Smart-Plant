// To parse this JSON data, do
//
//     final adminLog = adminLogFromJson(jsonString);

import 'dart:convert';

AdminLog adminLogFromJson(String str) => AdminLog.fromJson(json.decode(str));

String adminLogToJson(AdminLog data) => json.encode(data.toJson());

class AdminLog {
  AdminLog({
    this.success,
    this.data,
  });

  bool success;
  List<Datum> data;

  factory AdminLog.fromJson(Map<String, dynamic> json) => AdminLog(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.actionTxt,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  String actionTxt;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        userId: json["userId"] == null ? null : json["userId"],
        actionTxt: json["actionTxt"] == null ? null : json["actionTxt"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "userId": userId == null ? null : userId,
        "actionTxt": actionTxt == null ? null : actionTxt,
        "status": status == null ? null : status,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
