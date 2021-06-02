import 'package:http/http.dart' as http;
import 'package:login_fontend/model/user/allUser_model.dart';


  Future<AllUserModel> allUser(String userid ) async{
    try{
        final String apiUrl = "http://158.108.97.57:3000/api/mobile/admin/alluser?" ;
        final response = await http.post(apiUrl, body: {
        "myUserId":  userid ,
      }).timeout(const Duration(seconds: 5));
      if(response.statusCode == 200){
        //print("feaf");
        final String responseString = response.body;
        return allUserModelFromJson(responseString);
      }else{
        //print("fas");
        return null;
      }
    }catch(e) { 
      //print(e) ;
      return null;
      
    }

  
}
