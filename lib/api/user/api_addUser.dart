import 'package:http/http.dart' as http;
import 'package:login_fontend/model/user/addUser_model.dart';


  Future<AddUserModel> addUser(String email ,String password ,String first_name ,String last_name ,String rank ,String userid ) async{
    try{
        final String apiUrl = "http://158.108.97.158:3000/api/mobile/admin/adduser?" ;
        final response = await http.post(apiUrl, body: {
        "email":  email ,
        "password":  password,
        "first_name":  first_name,
        "last_name":  last_name,
        "rank":  rank,
        "myUserId":  userid ,
      }).timeout(const Duration(seconds: 5));
      if(response.statusCode == 200){
        //print("feaf");
        final String responseString = response.body;
        return addUserModelFromJson(responseString);
      }else{
        //print("fas");
        return null;
      }
    }catch(e) { 
      //print(e) ;
      return null;
    }

  
}
