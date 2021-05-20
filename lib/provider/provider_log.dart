import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';
import 'package:login_fontend/model/log/adminLog_model.dart';
import 'package:login_fontend/api/log/api_adminLog.dart';

import 'package:login_fontend/model/user/allUser_model.dart';
import 'package:login_fontend/api/user/api_allUser.dart';

class AdminLogProvider with ChangeNotifier {
  AdminLog alllog = AdminLog();
  AllUserModel alluser = AllUserModel();
  bool loading = false;
  List<String> actionTxt = [];
  List<String> dateformat1 = [];
  List<String> first_name = [];

  @override
  void getPostLog(String myUserId) async {
    alllog = await adminLog(myUserId);
    alluser = await allUser(myUserId);
    await addLog();
    notifyListeners();
  }

  Future addLog() async {
    try {
      this.actionTxt = [];
      this.dateformat1 = [];
      this.first_name = [];
      bool success = alllog.success;
      if (success == true && alllog.data.length != actionTxt.length) {
        for (int i = 0; i < alllog.data.length; i++) {
          this.actionTxt.add(alllog.data[i].actionTxt);
          String formattedDate =
              DateFormat.yMd().add_jm().format(alllog.data[i].updatedAt);
          this.dateformat1.add(formattedDate);
          for (int j = 0; j < alluser.alluser.length; j++) {
            if (alllog.data[i].userId == alluser.alluser[j].id) {
              this.first_name.add(alluser.alluser[j].email);
            }
          }//String url = "rtsp://admin:kusrc12345@158.108.122.4:554";
        }
      }
    } catch (e) {
      print("connect error2");
    }
  }
}
