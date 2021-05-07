import 'package:http/http.dart' as http;
import 'package:login_fontend/model/user/changePass_model.dart';


  Future<ChangePasswordrModel> changePass(String email  ,String userId  ,String new_password  ,String confirm_new_password  ) async{
    try{
        final String apiUrl = "http://158.108.97.158:3000/api/mobile/user/change-password?" ;
        final response = await http.post(apiUrl, body: {
        "email":  email  ,
        "userId":  userId ,
        "new_password":  new_password ,
        "confirm_new_password":  confirm_new_password ,
      }).timeout(const Duration(seconds: 5));
      if(response.statusCode == 200){
        //print("feaf");
        final String responseString = response.body;
        return changePasswordrModelFromJson(responseString);
      }else{
        //print("fas");
        return null;
      }
    }catch(e) { 
      //print(e) ;
      return null;
      
    }

  
}
