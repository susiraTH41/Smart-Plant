// To parse this JSON data, do
//
//     final editDevicesModel = editDevicesModelFromJson(jsonString);

import 'dart:convert';

EditDevicesModel editDevicesModelFromJson(String str) => EditDevicesModel.fromJson(json.decode(str));

String editDevicesModelToJson(EditDevicesModel data) => json.encode(data.toJson());

class EditDevicesModel {
    EditDevicesModel({
        this.success,
        this.msg,
    });

    bool success;
    String msg;

    factory EditDevicesModel.fromJson(Map<String, dynamic> json) => EditDevicesModel(
        success: json["success"] == null ? null : json["success"],
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "msg": msg == null ? null : msg,
    };
}
