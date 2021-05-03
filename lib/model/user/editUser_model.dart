// To parse this JSON data, do
//
//     final editUserModel = editUserModelFromJson(jsonString);

import 'dart:convert';

EditUserModel editUserModelFromJson(String str) => EditUserModel.fromJson(json.decode(str));

String editUserModelToJson(EditUserModel data) => json.encode(data.toJson());

class EditUserModel {
    EditUserModel({
        this.sccess,
        this.msg,
    });

    bool sccess;
    String msg;

    factory EditUserModel.fromJson(Map<String, dynamic> json) => EditUserModel(
        sccess: json["sccess"] == null ? null : json["sccess"],
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "sccess": sccess == null ? null : sccess,
        "msg": msg == null ? null : msg,
    };
}
