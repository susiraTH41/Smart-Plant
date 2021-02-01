import 'package:http/http.dart' as http;
import '../model/control_model.dart';


  Future<ControlModel> control(String action,String deviceId) async{
    try{
        final String apiUrl = "http://10.64.67.106:3000/mobile/api/control/${deviceId}";
        final response = await http.post(apiUrl, body: {
        "action": action
      }).timeout(const Duration(seconds: 5));
      if(response.statusCode == 200){
        //print("feaf");
        final String responseString = response.body;
        return controlModelFromJson(responseString);
      }else{
        //print("fas");
        return null;
      }
    }catch(e) { 
      //print(e) ;
      return null;
      
    }

  
}
