import 'package:http/http.dart' as http;
import 'package:login_fontend/model/sensor/addSensor_model.dart';


  Future<AddSensorModel> addSensor(String myUserId  ,String device_eui ,String device_name ) async{
    try{
        final String apiUrl = "http://158.108.97.158:3000/api/mobile/admin/sensor/add?" ;
        final response = await http.post(apiUrl, body: {
        "myUserId":  myUserId  ,
        "device_eui":  device_eui,
        "device_name":  device_name,

      }).timeout(const Duration(seconds: 5));
      if(response.statusCode == 200){
        //print("feaf");
        final String responseString = response.body;
        return addSensorModelFromJson(responseString);
      }else{
        //print("fas");
        return null;
      }
    }catch(e) { 
      //print(e) ;
      return null;
    }

  
}
