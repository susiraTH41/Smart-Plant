import 'package:http/http.dart' as http;
import 'package:login_fontend/model/cctv/allCctv_model.dart';


  Future<AllCctvModel> allCctv(String userid ) async{
    try{
        final String apiUrl = "http://158.108.97.160:3000/api/mobile/admin/cctv/all??" ;
        final response = await http.post(apiUrl, body: {
        "myUserId":  userid ,
      }).timeout(const Duration(seconds: 5));
      if(response.statusCode == 200){
        //print("feaf");
        final String responseString = response.body;
        return allCctvModelFromJson(responseString);
      }else{
        //print("fas");
        return null;
      }
    }catch(e) { 
      //print(e) ;
      return null;
      
    }

  
}
