import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'package:login_fontend/model/cctv/allCctv_model.dart';
import 'package:login_fontend/api/cctv/api_allCctv.dart';

class CctvProvider with ChangeNotifier {
  AllCctvModel allcctv = AllCctvModel();
  bool loading = false;
  List<String> name = [];
  List<int> status = [];
  List<String> ip = [];
  List<String> user_cctv = [];
  List<String> pass_cctv = [];
  List<String> url = [];
  List<int> id_cctv = [];
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
      this.ip = [];
      this.user_cctv = [];
      this.pass_cctv = [];
      this.url = [];
      this.status = [];
      this.id_cctv = [];
      bool success = allcctv.success;
      if (success == true && allcctv.data.length != name.length) {
        for (int i = 0; i < allcctv.data.length; i++) {
          this.name.add(allcctv.data[i].name);
          this.status.add(allcctv.data[i].status);
          this.url.add(
              "rtsp://${allcctv.data[i].user}:${allcctv.data[i].password}@${allcctv.data[i].ipPort}");
          this.ip.add(allcctv.data[i].ipPort);
          this.user_cctv.add(allcctv.data[i].user);
          this.pass_cctv.add(allcctv.data[i].password);
          this.id_cctv.add(allcctv.data[i].id);
          //String url = "rtsp://admin:kusrc12345@158.108.122.4:554";
        }
      }
    } catch (e) {
      print("connect error2");
    }
  }
}
