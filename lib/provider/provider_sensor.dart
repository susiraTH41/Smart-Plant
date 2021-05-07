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

  @override
  void getPostSensor(String myUserId) async {
    loading = true;
    allsensor = await allSensor(myUserId);
    loading = false;
    print('ddqwdqwdqwdqwd${allsensor.data.length}');
    print('ddqwdqwdqwdqwd${id.length}');
    print(deviceID);
    print(place);
    await addInfoOfSensor();
    //notifyListeners();
  }

  Future addInfoOfSensor() async {
    try {
      List<int> id = [];
      this.deviceID = [];
      this.place = [];
      bool success = allsensor.success;
      if (success == true && allsensor.data.length != id.length) {
        for (int i = 0; i < allsensor.data.length; i++) {
          this.id.add(allsensor.data[i].id);
          this.deviceID.add(allsensor.data[i].deviceId);
          this.place.add(allsensor.data[i].place);
        }
      }
    } catch (e) {
      print("connect error2");
    }
  }
}
