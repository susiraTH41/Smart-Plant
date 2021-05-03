import 'dart:convert';

ControlModel controlModelFromJson(String str) => ControlModel.fromJson(json.decode(str));

String controlModelToJson(ControlModel data) => json.encode(data.toJson());

class ControlModel {
    ControlModel({
        this.success,
    });

    bool success;

    factory ControlModel.fromJson(Map<String, dynamic> json) => ControlModel(
        success: json["success"] == null ? null : json["success"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
    };
}
