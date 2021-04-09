// To parse this JSON data, do
//
//     final pollutionsModel = pollutionsModelFromJson(jsonString);

import 'dart:convert';

List<PollutionsModel> pollutionsModelFromJson(String str) => List<PollutionsModel>.from(json.decode(str).map((x) => PollutionsModel.fromJson(x)));

String pollutionsModelToJson(List<PollutionsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PollutionsModel {
    PollutionsModel({
        this.id,
        this.deviceId,
        this.deviceStatus,
        this.plans,
        this.battery,
        this.no2,
        this.pm1,
        this.pm25,
        this.pm10,
        this.pressure,
        this.temperature,
        this.humidity,
        this.led,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String deviceId;
    int deviceStatus;
    String plans;
    int battery;
    int no2;
    int pm1;
    int pm25;
    int pm10;
    int pressure;
    int temperature;
    int humidity;
    int led;
    DateTime createdAt;
    DateTime updatedAt;

    factory PollutionsModel.fromJson(Map<String, dynamic> json) => PollutionsModel(
        id: json["id"] == null ? null : json["id"],
        deviceId: json["deviceID"] == null ? null : json["deviceID"],
        deviceStatus: json["deviceStatus"] == null ? null : json["deviceStatus"],
        plans: json["plans"] == null ? null : json["plans"],
        battery: json["battery"] == null ? null : json["battery"],
        no2: json["no2"] == null ? null : json["no2"],
        pm1: json["pm1"] == null ? null : json["pm1"],
        pm25: json["pm2_5"] == null ? null : json["pm2_5"],
        pm10: json["pm10"] == null ? null : json["pm10"],
        pressure: json["pressure"] == null ? null : json["pressure"],
        temperature: json["temperature"] == null ? null : json["temperature"],
        humidity: json["humidity"] == null ? null : json["humidity"],
        led: json["led"] == null ? null : json["led"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "deviceID": deviceId == null ? null : deviceId,
        "deviceStatus": deviceStatus == null ? null : deviceStatus,
        "plans": plans == null ? null : plans,
        "battery": battery == null ? null : battery,
        "no2": no2 == null ? null : no2,
        "pm1": pm1 == null ? null : pm1,
        "pm2_5": pm25 == null ? null : pm25,
        "pm10": pm10 == null ? null : pm10,
        "pressure": pressure == null ? null : pressure,
        "temperature": temperature == null ? null : temperature,
        "humidity": humidity == null ? null : humidity,
        "led": led == null ? null : led,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
