// To parse this JSON data, do
//
//     final addDevicesLoraModel = addDevicesLoraModelFromJson(jsonString);

import 'dart:convert';

AddDevicesLoraModel addDevicesLoraModelFromJson(String str) => AddDevicesLoraModel.fromJson(json.decode(str));

String addDevicesLoraModelToJson(AddDevicesLoraModel data) => json.encode(data.toJson());

class AddDevicesLoraModel {
    AddDevicesLoraModel({
        this.success,
        this.msg,
    });

    bool success;
    String msg;

    factory AddDevicesLoraModel.fromJson(Map<String, dynamic> json) => AddDevicesLoraModel(
        success: json["success"] == null ? null : json["success"],
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "msg": msg == null ? null : msg,
    };
}
