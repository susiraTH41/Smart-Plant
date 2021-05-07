import 'package:http/http.dart' as http;
import 'package:login_fontend/model/devices/pollutions_model.dart';

Future<List<PollutionsModel>> pollutions() async {
  try {
    final String apiUrl = "http://158.108.97.158:3000/ajax/get-sensors";
    var response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return pollutionsModelFromJson(responseString);
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
