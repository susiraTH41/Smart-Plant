import 'package:http/http.dart' as http;
import 'package:login_fontend/model/user/updateUser_model.dart';


  Future<UpdateUserModel> updateUser(String userId  ,String rank  ,String myUserId   ) async{
    try{
        final String apiUrl = "http://158.108.97.57:3000/api/mobile/admin/update-status?" ;
        final response = await http.post(apiUrl, body: {
        "userId":  userId  ,
        "rank":  rank,
        "myUserId":  myUserId,
      }).timeout(const Duration(seconds: 5));
      if(response.statusCode == 200){
        //print("feaf");
        final String responseString = response.body;
        return updateUserModelFromJson(responseString);
      }else{
        //print("fas");
        return null;
      }
    }catch(e) { 
      //print(e) ;
      return null;
      
    }

  
}
