// To parse this JSON data, do
//
//     final changePasswordrModel = changePasswordrModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordrModel changePasswordrModelFromJson(String str) => ChangePasswordrModel.fromJson(json.decode(str));

String changePasswordrModelToJson(ChangePasswordrModel data) => json.encode(data.toJson());

class ChangePasswordrModel {
    ChangePasswordrModel({
        this.sccess,
        this.msg,
    });

    bool sccess;
    String msg;

    factory ChangePasswordrModel.fromJson(Map<String, dynamic> json) => ChangePasswordrModel(
        sccess: json["sccess"] == null ? null : json["sccess"],
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "sccess": sccess == null ? null : sccess,
        "msg": msg == null ? null : msg,
    };
}
