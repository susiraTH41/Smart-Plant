import 'package:http/http.dart' as http;
import 'package:login_fontend/model/devices/addDevicesLora_model.dart';

Future<AddDevicesLoraModel> addDevicesLora(
    String myUserId, String device_eui, String device_name) async {
  try {
    final String apiUrl =
        "http://158.108.97.158:3000/api/mobile/admin/device/add/lora?";
    final response = await http.post(apiUrl, body: {
      "myUserId": myUserId,
      "device_eui": device_eui,
      "device_name": device_name,
    }).timeout(const Duration(seconds: 5));
    if (response.statusCode == 200) {
      //print("feaf");
      final String responseString = response.body;
      return addDevicesLoraModelFromJson(responseString);
    } else {
      //print("fas");
      return null;
    }
  } catch (e) {
    //print(e) ;
    return null;
  }
}
