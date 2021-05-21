import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:login_fontend/api/cctv/api_addCctv.dart';
import 'package:login_fontend/model/sensor/addSensor_model.dart';
import 'package:login_fontend/model/login_model.dart';

class AddCctv extends StatefulWidget {
  UserModel user;
  AddCctv(this.user);
  //AddUser({Key key}) : super(key: key);
  @override
  _AddCctvState createState() => _AddCctvState(this.user);
}

class _AddCctvState extends State<AddCctv> {
  UserModel user;
  _AddCctvState(this.user);
  @override
  var name_cctv = TextEditingController();
  var ip_cctv = TextEditingController();
  var port_cctv = TextEditingController();
  var user_cctv = TextEditingController();
  var password_cctv = TextEditingController();
  AddSensorModel addsubmit;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add CCTV'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: ListView(children: [
            buildTextField("Name", name_cctv),
            buildTextField("IP", ip_cctv),
            buildTextField("Port", port_cctv),
            buildTextField("User", user_cctv),
            buildTextField("Password", password_cctv),
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
        await _showMyDialog();
        if (this.addsubmit != null) {
          await showDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text('${addsubmit.msg}'),
            ),
          );
        }
        print(
            'dwqdwqd${this.ip_cctv.text.trim()}:${this.port_cctv.text.trim()}');
        this.addsubmit = null;
      },
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('You are adding this CCTV ?'),
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
                this.addsubmit = await addCctv(
                  this.name_cctv.text.trim(),
                  '${this.ip_cctv.text.trim()}:${this.port_cctv.text.trim()}',
                  this.user_cctv.text.trim(),
                  this.password_cctv.text.trim(),
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
}
