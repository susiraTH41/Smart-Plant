import 'package:http/http.dart' as http;
import 'package:login_fontend/model/sensor/addSensor_model.dart';

Future<AddSensorModel> addCctv(String name, String server, String user,
    String password, String myUserId) async {
  try {
    final String apiUrl =
        "http://158.108.97.160:3000/api/mobile/admin/cctv/add?";
    final response = await http.post(apiUrl, body: {
      "name": name,
      "server": server,
      "user": user,
      "password": password,
      "myUserId": myUserId,
    }).timeout(const Duration(seconds: 5));
    if (response.statusCode == 200) {
      //print("feaf");
      final String responseString = response.body;
      return addSensorModelFromJson(responseString);
    } else {
      //print("fas");
      return null;
    }
  } catch (e) {
    //print(e) ;
    return null;
  }
}
