import 'package:http/http.dart' as http;
import '../model/login_model.dart';


  Future<UserModel> loginUser(String emailController,String passwordController) async{
    try{
        final String apiUrl = "http://10.64.67.106:3000/mobile/api/login?";
        final response = await http.post(apiUrl, body: {
        "email": emailController,
        "password": passwordController
      }).timeout(const Duration(seconds: 5));
      if(response.statusCode == 200){
        //print("feaf");
        final String responseString = response.body;
        return userModelFromJson(responseString);
      }else{
        //print("fas");
        return null;
      }
    }catch(e) { 
      //print(e) ;
      return null;
      
    }

  
}
