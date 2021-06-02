import 'package:http/http.dart' as http;
import 'package:login_fontend/model/sensor/addSensor_model.dart';

Future<AddSensorModel> updateCctv(
    String id, String status, String myUserId) async {
  try {
    final String apiUrl =
        "http://158.108.97.57:3000/api/mobile/admin/cctv/update?";
    final response = await http.post(apiUrl, body: {
      "id": id,
      "status": status,
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
