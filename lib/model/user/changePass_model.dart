// To parse this JSON data, do
//
//     final changePasswordrModel = changePasswordrModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordrModel changePasswordrModelFromJson(String str) => ChangePasswordrModel.fromJson(json.decode(str));

String changePasswordrModelToJson(ChangePasswordrModel data) => json.encode(data.toJson());

class ChangePasswordrModel {
    ChangePasswordrModel({
        this.success,
        this.msg,
    });

    bool success;
    String msg;

    factory ChangePasswordrModel.fromJson(Map<String, dynamic> json) => ChangePasswordrModel(
        success: json["success"] == null ? null : json["success"],
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "msg": msg == null ? null : msg,
    };
}
