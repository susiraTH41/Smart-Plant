import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:login_fontend/api/cctv/api_editCctv.dart';
import 'package:login_fontend/model/sensor/addSensor_model.dart';
import 'package:login_fontend/api/cctv/api_updateCctv.dart';
import 'package:login_fontend/model/sensor/addSensor_model.dart';
import 'package:login_fontend/model/login_model.dart';

class EditCctv extends StatefulWidget {
  UserModel user;
  String name_cctv;
  String ip_cctv;
  String user_cctv;
  String pass_cctv;
  var deviceStatus;
  String deviceId;
  EditCctv(this.user, this.name_cctv, this.deviceStatus, this.user_cctv,
      this.pass_cctv, this.ip_cctv, this.deviceId);
  //EditUser({Key key}) : super(key: key);
  @override
  _EditCctvState createState() => _EditCctvState(
      user, name_cctv, deviceStatus, user_cctv, pass_cctv, ip_cctv, deviceId);
}

//_EditDevicesState
class _EditCctvState extends State<EditCctv> {
  UserModel user;
  String name_cctv;
  String ip_cctv;
  String user_cctv;
  String pass_cctv;
  var deviceStatus;
  var deviceId;
  var name_cctv_controll = TextEditingController();
  var ip_cctv_controll = TextEditingController();
  var user_cctv_controll = TextEditingController();
  var pass_cctv_controll = TextEditingController();
  var deviceId_controll = TextEditingController();
  String text;
  List<Color> colors;
  _EditCctvState(this.user, this.name_cctv, this.deviceStatus, this.user_cctv,
      this.pass_cctv, this.ip_cctv, this.deviceId);
  @override
  AddSensorModel editsubmit;
  AddSensorModel updatesubmit;
  Widget build(BuildContext context) {
    if (deviceStatus == 1) {
      this.text = "Open system";
      colors = [Colors.green, Colors.green[400], Colors.green[700]];
    } else if (deviceStatus == 0) {
      this.text = "Close system";
      colors = [Colors.red, Colors.red[400], Colors.red[700]];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit name CCTV'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: ListView(children: [
            buildTextField("Name", name_cctv, name_cctv_controll),
            buildTextField("URL", ip_cctv, ip_cctv_controll),
            buildTextField("User", user_cctv, user_cctv_controll),
            buildTextField("password", pass_cctv, pass_cctv_controll),
            buildButtonSubmit(),
            buildButtonCloseSystem(),
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
        await _showMyDialog();
        if (this.editsubmit != null) {
          await showDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              //content: Text('test'),
              title: Text('${editsubmit.msg}'),
            ),
          );
        }
        this.editsubmit = null;
      },
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('You are editing data of this sensor ?'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Are you srue ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Confirm'),
              onPressed: () async {
                if (this.name_cctv_controll.text.trim() == "") {
                  this.name_cctv_controll =
                      TextEditingController(text: this.name_cctv);
                }
                if (this.ip_cctv_controll.text.trim() == "") {
                  this.ip_cctv_controll =
                      TextEditingController(text: this.ip_cctv);
                }
                if (this.user_cctv_controll.text.trim() == "") {
                  this.user_cctv_controll =
                      TextEditingController(text: this.user_cctv);
                }
                if (this.pass_cctv_controll.text.trim() == "") {
                  this.pass_cctv_controll =
                      TextEditingController(text: this.pass_cctv);
                }
                this.editsubmit = await editCctv(
                  this.deviceId.toString(),
                  this.name_cctv_controll.text.trim(),
                  this.ip_cctv_controll.text.trim(),
                  this.user_cctv_controll.text.trim(),
                  this.pass_cctv_controll.text.trim(),
                  this.user.userinfo.id.toString(),
                );
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildButtonCloseSystem() {
    return InkWell(
      child: Container(
          constraints: BoxConstraints.expand(height: 50, width: 100),
          child: Text(this.text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white)),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: colors),
              borderRadius: BorderRadius.circular(16),
              color: Colors.green[200]),
          margin: EdgeInsets.only(top: 16),
          padding: EdgeInsets.all(12)),
      onTap: () async {
        await _showMyDialogclose();
        if (this.updatesubmit != null) {
          if (this.updatesubmit.success == true) {
            if (this.deviceStatus == 0) {
              setState(() {
                this.text = "Open system";
                this.colors = [
                  Colors.green,
                  Colors.green[400],
                  Colors.green[700]
                ];
              });
            } else if (this.deviceStatus == 1) {
              setState(() {
                this.text = "Close system";
                this.colors = [Colors.red, Colors.red[400], Colors.red[700]];
              });
            }
          }
          await showDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              //content: Text('test'),
              title: Text('${updatesubmit.msg}'),
            ),
          );
        }
        this.updatesubmit = null;
      },
    );
  }

  Future<void> _showMyDialogclose() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('You are closing this sensor ?'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Are you srue ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Confirm'),
              onPressed: () async {
                if (this.deviceStatus == 1) {
                  this.deviceStatus = 0;
                  this.updatesubmit = await updateCctv(
                    this.deviceId.toString(),
                    this.deviceStatus.toString(),
                    this.user.userinfo.id.toString(),
                  );
                } else if (this.deviceStatus == 0) {
                  this.deviceStatus = 1;
                  this.updatesubmit = await updateCctv(
                    this.deviceId.toString(),
                    this.deviceStatus.toString(),
                    this.user.userinfo.id.toString(),
                  );
                }
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
