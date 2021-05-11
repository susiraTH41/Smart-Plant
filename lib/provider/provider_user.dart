import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'package:login_fontend/model/user/allUser_model.dart';
import 'package:login_fontend/api/user/api_allUser.dart';

class UserProvider with ChangeNotifier {
  AllUserModel alluser = AllUserModel();
  bool loading = false;
  List<int> userId = [];
  List<String> email = [];
  List<String> first_name = [];
  List<String> last_name = [];
  List<String> rank = [];

  @override
  void getPostUser(String myUserId) async {
    alluser = await allUser(myUserId);
    await addInfoOfUser();
    notifyListeners();
  }

  Future addInfoOfUser() async {
    try {
      this.userId = [];
      this.email = [];
      this.first_name = [];
      this.last_name = [];
      this.rank = [];
      bool success = alluser.success;
      if (success == true && alluser.alluser.length != this.email.length) {
        for (int i = 0; i < alluser.alluser.length; i++) {
          this.userId.add(alluser.alluser[i].id);
          this.email.add(alluser.alluser[i].email);
          this.first_name.add(alluser.alluser[i].firstName);
          this.last_name.add(alluser.alluser[i].lastName);
          this.rank.add(alluser.alluser[i].rank.toUpperCase());
        }
      }
    } catch (e) {
      print("connect error2");
    }
  }
}
