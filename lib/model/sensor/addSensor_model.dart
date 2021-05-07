// To parse this JSON data, do
//
//     final addSensorModel = addSensorModelFromJson(jsonString);

import 'dart:convert';

AddSensorModel addSensorModelFromJson(String str) =>
    AddSensorModel.fromJson(json.decode(str));

String addSensorModelToJson(AddSensorModel data) => json.encode(data.toJson());

class AddSensorModel {
  AddSensorModel({
    this.success,
    this.msg,
  });

  bool success;
  String msg;

  factory AddSensorModel.fromJson(Map<String, dynamic> json) => AddSensorModel(
        success: json["success"] == null ? null : json["success"],
        msg: json["msg"] == null ? null : json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "msg": msg == null ? null : msg,
      };
}
