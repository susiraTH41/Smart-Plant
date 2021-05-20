import 'package:flutter/material.dart';
import 'package:login_fontend/model/login_model.dart';
import 'package:login_fontend/screen/tamplate/pollution_box.dart';

class Pollutions extends StatefulWidget {
  int battery;
  int no2;
  int pm1;
  int pm25;
  int pm10;
  int pressure;
  int temperature;
  int humidity;
  int led;
  Pollutions(this.battery, this.no2, this.pm1, this.pm25, this.pm10,
      this.pressure, this.temperature, this.humidity, this.led);

  _PollutionsState createState() => _PollutionsState(
      this.battery,
      this.no2,
      this.pm1,
      this.pm25,
      this.pm10,
      this.pressure,
      this.temperature,
      this.humidity,
      this.led);
}

class _PollutionsState extends State<Pollutions> {
  int battery;
  int no2;
  int pm1;
  int pm25;
  int pm10;
  int pressure;
  int temperature;
  int humidity;
  int led;

  _PollutionsState(this.battery, this.no2, this.pm1, this.pm25, this.pm10,
      this.pressure, this.temperature, this.humidity, this.led);

  @override
  Widget build(BuildContext context) {
    List<MoneyBox> menu = [
      MoneyBox("NO2", '${no2} ppb', 100),
      MoneyBox("PM 1", '${pm1} μg/m³', 100),
      MoneyBox("PM 2.5", '${pm25} μg/m³', 100),
      MoneyBox("PM10", '${pm10} μg/m³', 100),
      MoneyBox("Pressure", '${pressure} mbar', 100),
      MoneyBox("Temperature", '${temperature} C', 100),
      MoneyBox("Humidity", '${humidity} %', 100),
    ];
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('pollutions'),
        ),
        body: ListView.builder(
          itemCount: menu.length,
          itemBuilder: (BuildContext, int index) {
            MoneyBox box = menu[index];
            return box;
          },
        ));
  }
}

