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
    loading = true;
    alluser = await allUser(myUserId);
    loading = false;
    print('ddqwdqwdqwdqwd${alluser.alluser.length}');
    print(email);
    print(first_name);
    print(last_name);
    print(rank);
    await addInfoOfUser();
    //notifyListeners();
  }

  Future addInfoOfUser() async {
    try {
      bool success = alluser.sccess;
      if (success == true && alluser.alluser.length != email.length) {
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
