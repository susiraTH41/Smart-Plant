import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'package:login_fontend/model/sensor/allSensor_model.dart';
import 'package:login_fontend/api/sensor/api_allSensor.dart';

class SensorProvider with ChangeNotifier {
  AllSensorModel allsensor = AllSensorModel();
  bool loading = false;
  List<int> id = [];
  List<String> deviceID = [];
  List<String> place = [];
  List<int> deviceStatus = [];


  ///pollutions
  List<int> battery = [];
  List<int> no2 = [];
  List<int> pm1 = [];
  List<int> pm25 = [];
  List<int> pm10 = [];
  List<int> pressure = [];
  List<int> temperature = [];
  List<int> humidity = [];
  List<int> led = [];

  @override
  void getPostSensor(String myUserId) async {
    allsensor = await allSensor(myUserId);
    await addInfoOfSensor();
    notifyListeners();
  }

  Future addInfoOfSensor() async {
    try {
      this.id = [];
      this.deviceID = [];
      this.place = [];
      this.deviceStatus = [];

      ///pollutions
      this.battery = [];
      this.no2 = [];
      this.pm1 = [];
      this.pm25 = [];
      this.pm10 = [];
      this.pressure = [];
      this.temperature = [];
      this.humidity = [];
      this.led = [];
      bool success = allsensor.success;
      if (success == true && allsensor.data.length != id.length) {
        for (int i = 0; i < allsensor.data.length; i++) {

          this.id.add(allsensor.data[i].id);
          this.deviceID.add(allsensor.data[i].deviceId);
          this.place.add(allsensor.data[i].place);
          this.deviceStatus.add(allsensor.data[i].deviceStatus);

          this.battery.add(allsensor.data[i].battery);
          this.no2.add(allsensor.data[i].no2);
          this.pm1.add(allsensor.data[i].pm1);
          this.pm25.add(allsensor.data[i].pm25);
          this.pm10.add(allsensor.data[i].pm10);
          this.pressure.add(allsensor.data[i].pressure);
          this.temperature.add(allsensor.data[i].temperature);
          this.humidity.add(allsensor.data[i].humidity);
          this.led.add(allsensor.data[i].led);
        }
      }
    } catch (e) {
      print("connect error2");
    }
  }


}
