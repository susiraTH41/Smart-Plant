// To parse this JSON data, do
//
//     final addUserModel = addUserModelFromJson(jsonString);

import 'dart:convert';

AddUserModel addUserModelFromJson(String str) => AddUserModel.fromJson(json.decode(str));

String addUserModelToJson(AddUserModel data) => json.encode(data.toJson());

class AddUserModel {
    AddUserModel({
        this.success,
        this.msg,
    });

    bool success;
    String msg;

    factory AddUserModel.fromJson(Map<String, dynamic> json) => AddUserModel(
        success: json["success"] == null ? null : json["success"],
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "msg": msg == null ? null : msg,
    };
}
