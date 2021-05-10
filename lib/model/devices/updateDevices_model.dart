// To parse this JSON data, do
//
//     final updateDevicesModel = updateDevicesModelFromJson(jsonString);

import 'dart:convert';

UpdateDevicesModel updateDevicesModelFromJson(String str) => UpdateDevicesModel.fromJson(json.decode(str));

String updateDevicesModelToJson(UpdateDevicesModel data) => json.encode(data.toJson());

class UpdateDevicesModel {
    UpdateDevicesModel({
        this.success,
        this.msg,
    });

    bool success;
    String msg;

    factory UpdateDevicesModel.fromJson(Map<String, dynamic> json) => UpdateDevicesModel(
        success: json["success"] == null ? null : json["success"],
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "msg": msg == null ? null : msg,
    };
}
