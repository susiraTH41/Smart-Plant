// To parse this JSON data, do
//
//     final editSensorModel = editSensorModelFromJson(jsonString);

import 'dart:convert';

EditSensorModel editSensorModelFromJson(String str) => EditSensorModel.fromJson(json.decode(str));

String editSensorModelToJson(EditSensorModel data) => json.encode(data.toJson());

class EditSensorModel {
    EditSensorModel({
        this.success,
        this.msg,
    });

    bool success;
    String msg;

    factory EditSensorModel.fromJson(Map<String, dynamic> json) => EditSensorModel(
        success: json["success"] == null ? null : json["success"],
        msg: json["msg"] == null ? null : json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "msg": msg == null ? null : msg,
    };
}
