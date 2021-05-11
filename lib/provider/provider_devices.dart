import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'package:login_fontend/model/devices/allDevices_model.dart';
import 'package:login_fontend/api/devices/api_allDevices.dart';

class DevicesProvider with ChangeNotifier {
  AllDevicesModel alldevices = AllDevicesModel();
  bool loading = false;
  List<int> id = [];
  List<String> deviceID = [];
  List<String> place = [];
  List<int> deviceStatus = [];
  @override
  void getPostDevices(String myUserId) async {
    alldevices = await allDevices(myUserId);
    await addInfoOfDevices();
    print(deviceStatus);
    print(id);
    print(place);
    print(deviceID);
    notifyListeners();
  }

  Future addInfoOfDevices() async {
    try {
      this.id = [];
      this.deviceID = [];
      this.place = [];
      this.deviceStatus = [];
      bool success = alldevices.success;
      if (success == true && alldevices.data.length != id.length) {
        for (int i = 0; i < alldevices.data.length; i++) {
          this.id.add(alldevices.data[i].id);
          this.deviceID.add(alldevices.data[i].deviceId);
          this.place.add(alldevices.data[i].place);
          this.deviceStatus.add(alldevices.data[i].deviceStatus);
        }
      }
    } catch (e) {
      print("connect error2");
    }
  }
}
