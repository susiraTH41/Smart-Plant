// To parse this JSON data, do
//
//     final controlModel = controlModelFromJson(jsonString);

import 'dart:convert';

ControlModel controlModelFromJson(String str) => ControlModel.fromJson(json.decode(str));

String controlModelToJson(ControlModel data) => json.encode(data.toJson());

class ControlModel {
    ControlModel({
        this.success,
        this.msg,
    });

    bool success;
    String msg;

    factory ControlModel.fromJson(Map<String, dynamic> json) => ControlModel(
        success: json["success"] == null ? null : json["success"],
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "msg": msg == null ? null : msg,
    };
}
