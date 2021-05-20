import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'package:login_fontend/model/cctv/allCctv_model.dart';
import 'package:login_fontend/api/cctv/api_allCctv.dart';
class CctvProvider with ChangeNotifier {
  AllCctvModel allcctv = AllCctvModel();
  bool loading = false;
  List<String> name = [];
  List<int> status = [];

  List<String> url = [];

  @override
  void getPostCctv(String myUserId) async {
    allcctv = await allCctv(myUserId);
    await addCctv();
    print(url);
    notifyListeners();
  }

  Future addCctv() async {
    try {
      this.name = [];

      this.status = [];
      bool success = allcctv.success;
      if (success == true && allcctv.data.length != name.length) {
        for (int i = 0; i < allcctv.data.length; i++) {
          this.name.add(allcctv.data[i].name);
          this.status.add(allcctv.data[i].status);
          this.url.add(
              "rtsp://${allcctv.data[i].user}:${allcctv.data[i].password}@${allcctv.data[i].ipPort}");

          //String url = "rtsp://admin:kusrc12345@158.108.122.4:554";
        }
      }
    } catch (e) {
      print("connect error2");
    }
  }
}
