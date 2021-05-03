// To parse this JSON data, do
//
//     final addUserModel = addUserModelFromJson(jsonString);

import 'dart:convert';

AddUserModel addUserModelFromJson(String str) => AddUserModel.fromJson(json.decode(str));

String addUserModelToJson(AddUserModel data) => json.encode(data.toJson());

class AddUserModel {
    AddUserModel({
        this.sccess,
        this.msg,
    });

    bool sccess;
    String msg;

    factory AddUserModel.fromJson(Map<String, dynamic> json) => AddUserModel(
        sccess: json["sccess"] == null ? null : json["sccess"],
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "sccess": sccess == null ? null : sccess,
        "msg": msg == null ? null : msg,
    };
}
