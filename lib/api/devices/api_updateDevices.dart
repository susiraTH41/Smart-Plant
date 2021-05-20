import 'package:http/http.dart' as http;
import 'package:login_fontend/model/devices/updateDevices_model.dart';


  Future<UpdateDevicesModel> updateDevices(String device_id  ,String state   ,String myUserId    ) async{
    try{
        final String apiUrl = "http://158.108.97.160:3000/api/mobile/admin/device/edit/enable?" ;
        final response = await http.post(apiUrl, body: {
        "device_id":  device_id  ,
        "state":  state ,
        "myUserId":  myUserId ,
      }).timeout(const Duration(seconds: 5));
      if(response.statusCode == 200){
        //print("feaf");
        final String responseString = response.body;
        return updateDevicesModelFromJson(responseString);
      }else{
        //print("fas");
        return null;
      }
    }catch(e) { 
      //print(e) ;
      return null;
      
    }

  
}
