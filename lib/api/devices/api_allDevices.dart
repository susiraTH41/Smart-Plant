import 'package:http/http.dart' as http;
import 'package:login_fontend/model/devices/allDevices_model.dart';


  Future<AllDevicesModel> allDevices(String userid ) async{
    try{
        final String apiUrl = "http://158.108.97.160:3000/api/mobile/admin/device/all?" ;
        final response = await http.post(apiUrl, body: {
        "myUserId":  userid ,
      }).timeout(const Duration(seconds: 5));
      if(response.statusCode == 200){
        //print("feaf");
        final String responseString = response.body;
        return allDevicesModelFromJson(responseString);
      }else{
        //print("fas");
        return null;
      }
    }catch(e) { 
      //print(e) ;
      return null;
      
    }

  
}
