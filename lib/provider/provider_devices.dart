import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'package:login_fontend/model/user/allUser_model.dart';
import 'package:login_fontend/api/user/api_allUser.dart';

class DevicesProvider with ChangeNotifier {
  AllUserModel alldevices = AllUserModel();
  bool loading = false;
  List<int> userId = [];
  List<String> email = [];
  List<String> first_name = [];
  List<String> last_name = [];
  List<String> rank = [];

  @override
  void getPostDevices(String myUserId) async {
    loading = true;
    alldevices = await allUser(myUserId);
    loading = false;
    print('ddqwdqwdqwdqwd${alldevices.alluser.length}');
    print(email);
    print(first_name);
    print(last_name);
    print(rank);
    await addInfoOfDevices();
    //notifyListeners();
  }

  Future addInfoOfDevices() async {
    try {
      bool success = alldevices.sccess;
      if (success == true && alldevices.alluser.length != email.length) {
        for (int i = 0; i < alldevices.alluser.length; i++) {
          this.userId.add(alldevices.alluser[i].id);
          this.email.add(alldevices.alluser[i].email);
          this.first_name.add(alldevices.alluser[i].firstName);
          this.last_name.add(alldevices.alluser[i].lastName);
          this.rank.add(alldevices.alluser[i].rank.toUpperCase());
        }
      }
    } catch (e) {
      print("connect error2");
    }
  }
}
