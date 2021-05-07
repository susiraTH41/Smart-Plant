import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_fontend/api/devices/api_editDevices.dart';
import 'package:login_fontend/model/devices/editDevices_model.dart';
import 'package:login_fontend/model/login_model.dart';

class EditDevices extends StatefulWidget {
  UserModel user;
  var userId;
  var device_new_name ;

  EditDevices(this.user,this.userId, this.device_new_name  );
  //EditUser({Key key}) : super(key: key);
  @override
  _EditDevicesState createState() =>
      _EditDevicesState(user, userId, device_new_name);
}

class _EditDevicesState extends State<EditDevices> {
  UserModel user;
  var userId;
  String device_new_name ;
  var device_new_name_controll = TextEditingController();

  _EditDevicesState(this.user, this.userId, this.device_new_name );
  @override
  EditDevicesModel editsubmit;
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: Text('Edit name device'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: ListView(children: [
              buildTextField("Name", device_new_name , device_new_name_controll),
              buildButtonSignIn()
            ]))),
      );
    
  }

  Widget buildTextField(String labelText, String placeholder, var controll) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: controll,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget buildButtonSignIn() {
    return InkWell(
      child: Container(
          constraints: BoxConstraints.expand(height: 50, width: 100),
          child: Text("Confrim",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white)),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blue[400], Colors.blue[700]]),
              borderRadius: BorderRadius.circular(16),
              color: Colors.green[200]),
          margin: EdgeInsets.only(top: 16),
          padding: EdgeInsets.all(12)),
      onTap: () async {
        
        if (this.device_new_name_controll.text.trim() == "") {
          this.device_new_name_controll = TextEditingController(text: this.device_new_name );
        }
       
          editsubmit = await editDevices(
            
            this.userId.toString(),
            this.device_new_name_controll.text.trim(),
            this.user.userinfo.id.toString(),
          );
          showDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              //content: Text('test'),
              content: Text('${editsubmit.msg}'),
            ),
          );
        
      
      },
    );
  }
}
