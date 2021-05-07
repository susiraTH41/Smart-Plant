import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_fontend/api/user/api_changePass.dart';
import 'package:login_fontend/model/user/changePass_model.dart';
import 'package:login_fontend/model/login_model.dart';

class ChangePassword extends StatefulWidget {
  UserModel user;
  ChangePassword(this.user);
  @override
  _ChangePasswordState createState() => _ChangePasswordState(this.user);
}

class _ChangePasswordState extends State<ChangePassword> {
  UserModel user;
  _ChangePasswordState(this.user);
  @override
  var new_password = TextEditingController();
  var confirm_new_password = TextEditingController();

  ChangePasswordrModel changesubmit;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change password'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: ListView(children: [
            buildTextField("New password", new_password),
            buildTextField("Confirm new password", confirm_new_password),
            buildButtonSignIn()
          ]))),
    );
  }

  Widget buildTextField(String labelText, var placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: true,
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
        changesubmit = await changePass(
            this.user.userinfo.email,
            this.user.userinfo.id.toString(),
            this.new_password.text.trim(),
            this.confirm_new_password.text.trim());
        showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            //content: Text('test'),
            content: Text('${changesubmit.msg}'),
          ),
        );
      },
    );
  }
}
