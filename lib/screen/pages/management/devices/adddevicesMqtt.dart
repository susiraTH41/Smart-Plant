import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_fontend/api/devices/api_addDevicesMqtt.dart';
import 'package:login_fontend/model/devices/addDevicesMqtt_model.dart';
import 'package:login_fontend/model/login_model.dart';

class AddDevicesMqtt extends StatefulWidget {
  UserModel user;
  AddDevicesMqtt(this.user);
  //AddUser({Key key}) : super(key: key);
  @override
  _AddDevicesMqttState createState() => _AddDevicesMqttState(this.user);
}

class _AddDevicesMqttState extends State<AddDevicesMqtt> {
   UserModel user;
   _AddDevicesMqttState(this.user);
  @override
  var device_eui = TextEditingController();
  var device_name = TextEditingController();
  AddDevicesMqttModel addsubmit;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Devices MQTT'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: ListView(children: [
            buildTextField("Device EUI", device_eui),
            buildTextField("Device Name", device_name),
            buildButtonSubmit()
          ]))),
    );
  }

  Widget buildTextField(String labelText, var placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: placeholder,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }


  Widget buildButtonSubmit() {
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
        addsubmit = await addDevicesMqtt(
            this.user.userinfo.id.toString(),
            this.device_eui.text.trim(),
            this.device_name.text.trim(),);
        showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            //content: Text('test'),
            content: Text('${addsubmit.msg}'),
          ),
        );
      },
    );
  }
}
