import 'package:http/http.dart' as http;
import '../model/pollutions_model.dart';

Future <List<PollutionsModel>> pollutions() async {
  try {
    final String apiUrl = "http://10.64.135.77:3000/ajax/get-sensors";
    var response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return pollutionsModelFromJson(responseString) ;
    } 
    else {
      return null;
    }
  } 
  catch (e) {

    return null;
  }
}
