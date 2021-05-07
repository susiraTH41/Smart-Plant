// To parse this JSON data, do
//
//     final allDevicesModel = allDevicesModelFromJson(jsonString);

import 'dart:convert';

AllDevicesModel allDevicesModelFromJson(String str) => AllDevicesModel.fromJson(json.decode(str));

String allDevicesModelToJson(AllDevicesModel data) => json.encode(data.toJson());

class AllDevicesModel {
    AllDevicesModel({
        this.success,
        this.data,
    });

    bool success;
    List<Datum> data;

    factory AllDevicesModel.fromJson(Map<String, dynamic> json) => AllDevicesModel(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.deviceId,
        this.deviceStatus,
        this.isMqtt,
        this.place,
        this.battery,
        this.lastAction,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String deviceId;
    int deviceStatus;
    bool isMqtt;
    String place;
    int battery;
    String lastAction;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        deviceId: json["deviceID"] == null ? null : json["deviceID"],
        deviceStatus: json["deviceStatus"] == null ? null : json["deviceStatus"],
        isMqtt: json["isMqtt"] == null ? null : json["isMqtt"],
        place: json["place"] == null ? null : json["place"],
        battery: json["battery"] == null ? null : json["battery"],
        lastAction: json["lastAction"] == null ? null : json["lastAction"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "deviceID": deviceId == null ? null : deviceId,
        "deviceStatus": deviceStatus == null ? null : deviceStatus,
        "isMqtt": isMqtt == null ? null : isMqtt,
        "place": place == null ? null : place,
        "battery": battery == null ? null : battery,
        "lastAction": lastAction == null ? null : lastAction,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
