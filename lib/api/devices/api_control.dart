import 'package:http/http.dart' as http;
import 'package:login_fontend/model/devices/control_model.dart';


  Future<ControlModel> control(String myUserId,String deviceId,String deviceType,String action) async{
    try{
        final String apiUrl = "http://158.108.97.57:3000/api/mobile/device/control?";
        final response = await http.post(apiUrl, body: {
        "myUserId":myUserId,
        "deviceId":deviceId,
        "deviceType":deviceType,
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
