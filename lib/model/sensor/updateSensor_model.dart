// To parse this JSON data, do
//
//     final updateSensorModel = updateSensorModelFromJson(jsonString);

import 'dart:convert';

UpdateSensorModel updateSensorModelFromJson(String str) => UpdateSensorModel.fromJson(json.decode(str));

String updateSensorModelToJson(UpdateSensorModel data) => json.encode(data.toJson());

class UpdateSensorModel {
    UpdateSensorModel({
        this.success,
        this.msg,
    });

    bool success;
    String msg;

    factory UpdateSensorModel.fromJson(Map<String, dynamic> json) => UpdateSensorModel(
        success: json["success"] == null ? null : json["success"],
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "msg": msg == null ? null : msg,
    };
}
