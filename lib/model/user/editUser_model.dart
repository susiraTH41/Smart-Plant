// To parse this JSON data, do
//
//     final editUserModel = editUserModelFromJson(jsonString);

import 'dart:convert';

EditUserModel editUserModelFromJson(String str) => EditUserModel.fromJson(json.decode(str));

String editUserModelToJson(EditUserModel data) => json.encode(data.toJson());

class EditUserModel {
    EditUserModel({
        this.success,
        this.msg,
    });

    bool success;
    String msg;

    factory EditUserModel.fromJson(Map<String, dynamic> json) => EditUserModel(
        success: json["success"] == null ? null : json["success"],
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "msg": msg == null ? null : msg,
    };
}
