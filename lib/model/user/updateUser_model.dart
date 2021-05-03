// To parse this JSON data, do
//
//     final updateUserModel = updateUserModelFromJson(jsonString);

import 'dart:convert';

UpdateUserModel updateUserModelFromJson(String str) => UpdateUserModel.fromJson(json.decode(str));

String updateUserModelToJson(UpdateUserModel data) => json.encode(data.toJson());

class UpdateUserModel {
    UpdateUserModel({
        this.sccess,
        this.msg,
    });

    bool sccess;
    String msg;

    factory UpdateUserModel.fromJson(Map<String, dynamic> json) => UpdateUserModel(
        sccess: json["sccess"] == null ? null : json["sccess"],
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "sccess": sccess == null ? null : sccess,
        "msg": msg == null ? null : msg,
    };
}
