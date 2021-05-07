import 'package:http/http.dart' as http;
import 'package:login_fontend/model/sensor/editSensor_model.dart';

Future<EditSensorModel> editSensor(
    String device_id, String device_new_name, String myUserId) async {
  try {
    final String apiUrl =
        "http://158.108.97.158:3000/api/mobile/admin/sensor/edit/name?";
    final response = await http.post(apiUrl, body: {
      "device_id": device_id,
      "device_new_name": device_new_name,
      "myUserId": myUserId,
    }).timeout(const Duration(seconds: 5));
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return editSensorModelFromJson(responseString);
    } else {
      //print("fas");
      return null;
    }
  } catch (e) {
    //print(e) ;
    return null;
  }
}
