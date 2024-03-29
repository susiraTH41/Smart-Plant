import 'package:http/http.dart' as http;
import 'package:login_fontend/model/user/editUser_model.dart';

Future<EditUserModel> editUser(String myUserId, String userId, String email,
    String first_name, String last_name, String rank) async {
  try {
    final String apiUrl =
        "http://158.108.97.57:3000/api/mobile/admin/edituser?";
    final response = await http.post(apiUrl, body: {
      "myUserId": myUserId,
      "userId": userId,
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "rank": rank,
    }).timeout(const Duration(seconds: 5));
    if (response.statusCode == 200) {
      //print("feaf");
      final String responseString = response.body;
      return editUserModelFromJson(responseString);
    } else {
      //print("fas");
      return null;
    }
  } catch (e) {
    //print(e) ;
    return null;
  }
}
