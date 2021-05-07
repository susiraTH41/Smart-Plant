// To parse this JSON data, do
//
//     final addDevicesMqttModel = addDevicesMqttModelFromJson(jsonString);

import 'dart:convert';

AddDevicesMqttModel addDevicesMqttModelFromJson(String str) => AddDevicesMqttModel.fromJson(json.decode(str));

String addDevicesMqttModelToJson(AddDevicesMqttModel data) => json.encode(data.toJson());

class AddDevicesMqttModel {
    AddDevicesMqttModel({
        this.success,
        this.msg,
    });

    bool success;
    String msg;

    factory AddDevicesMqttModel.fromJson(Map<String, dynamic> json) => AddDevicesMqttModel(
        success: json["success"] == null ? null : json["success"],
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "msg": msg == null ? null : msg,
    };
}
