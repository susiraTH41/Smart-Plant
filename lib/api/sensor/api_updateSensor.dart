import 'package:http/http.dart' as http;
import 'package:login_fontend/model/sensor/updateSensor_model.dart';


  Future<UpdateSensorModel> updateSensor(String device_id,String state,String myUserId) async{
    try{
        final String apiUrl = "http://158.108.97.158:3000/api/mobile/admin/sensor/edit/enable?" ;
        final response = await http.post(apiUrl, body: {
        "device_id":  device_id  ,
        "state":  state ,
        "myUserId":  myUserId ,
      }).timeout(const Duration(seconds: 5));
      if(response.statusCode == 200){
        //print("feaf");
        final String responseString = response.body;
        return updateSensorModelFromJson(responseString);
      }else{
        //print("fas");
        return null;
      }
    }catch(e) { 
      //print(e) ;
      return null;
      
    }

  
}
