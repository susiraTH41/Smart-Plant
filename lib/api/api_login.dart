import 'package:http/http.dart' as http;
import 'package:login_fontend/model/login_model.dart';

Future<UserModel> loginUser(
    String emailController, String passwordController) async {
  try {
    final String apiUrl = "http://158.108.97.57:3000/api/mobile/login?";
    final response = await http.post(apiUrl, body: {
      "email": emailController,
      "password": passwordController
    }).timeout(const Duration(seconds: 5));
    if (response.statusCode == 200) {

      final String responseString = response.body;
      return userModelFromJson(responseString);
    } 
    else {
      
      return null;
    }
  } 
  catch (e) {

    return null;
  }
}
