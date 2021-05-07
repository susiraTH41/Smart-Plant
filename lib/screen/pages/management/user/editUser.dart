import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_fontend/api/user/api_editUser.dart';
import 'package:login_fontend/api/user/api_updateUser.dart';
import 'package:login_fontend/model/user/editUser_model.dart';
import 'package:login_fontend/model/user/updateUser_model.dart';
import 'package:login_fontend/model/user/allUser_model.dart';
import 'package:login_fontend/model/login_model.dart';

class EditUser extends StatefulWidget {
  UserModel user;
  var userId;
  var email;
  var first_name;
  var last_name;
  String rank;

  EditUser(this.user, this.userId, this.email, this.first_name, this.last_name,
      this.rank);
  //EditUser({Key key}) : super(key: key);
  @override
  _EditUserState createState() =>
      _EditUserState(user, userId, email, first_name, last_name, rank);
}

class _EditUserState extends State<EditUser> {
  UserModel user;
  var userId;
  String email;
  String first_name;
  String last_name;
  String dropdownValue = "";
  var email_controll = TextEditingController();
  var first_name_controll = TextEditingController();
  var last_name_controll = TextEditingController();
  _EditUserState(this.user, this.userId, this.email, this.first_name,
      this.last_name, this.dropdownValue);
  @override
  EditUserModel editsubmit;
  UpdateUserModel updatesubmit;
  Widget build(BuildContext context) {
    if (this.email == "beer@hotmail.com") {
      return Scaffold(
        appBar: AppBar(
          title: Text('Edit User'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: ListView(children: [
              buildTextField("E-mail", email, email_controll),
              buildTextField("Firstname", first_name, first_name_controll),
              buildTextField("Lastname", last_name, last_name_controll),
              buildButtonSignIn()
            ]))),
      );
    }
    if (this.dropdownValue != "SUSPEND" && this.email != "beer@hotmail.com") {
      return Scaffold(
        appBar: AppBar(
          title: Text('Edit User'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: ListView(children: [
              buildTextField("E-mail", email, email_controll),
              buildTextField("Firstname", first_name, first_name_controll),
              buildTextField("Lastname", last_name, last_name_controll),
              builddropdowns(),
              buildButtonSignIn()
            ]))),
      );
    }
    if (this.dropdownValue == "SUSPEND") {
      return Scaffold(
        appBar: AppBar(
          title: Text('Edit User'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: ListView(
                    children: [builddropdowns(), buildButtonSignIn()]))),
      );
    }
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

  @override
  Widget builddropdowns() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        'Select rank',
        'MEMBER',
        'ADMIN',
        'STAFF',
        'TECHNIC',
        'SUSPEND'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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
        print(this.email_controll.text.trim());
        if (this.email_controll.text.trim() == "") {
          this.email_controll = TextEditingController(text: this.email);
        }
        if (this.first_name_controll.text.trim() == "") {
          this.first_name_controll =
              TextEditingController(text: this.first_name);
        }
        if (this.last_name_controll.text.trim() == "") {
          this.last_name_controll = TextEditingController(text: this.last_name);
        }
        if (dropdownValue != "SUSPEND" || this.email == "beer@hotmail.com") {
          editsubmit = await editUser(
            this.user.userinfo.id.toString(),
            this.userId.toString(),
            this.email_controll.text.trim(),
            this.first_name_controll.text.trim(),
            this.last_name_controll.text.trim(),
            this.dropdownValue,
          );
          showDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              //content: Text('test'),
              content: Text('${editsubmit.msg}'),
            ),
          );
        }
        if (dropdownValue == "SUSPEND") {
          updatesubmit = await updateUser(
            this.userId.toString(),
            this.dropdownValue,
            this.user.userinfo.id.toString(),
          );
          showDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              //content: Text('test'),
              content: Text('${updatesubmit.msg}'),
            ),
          );
        }
      },
    );
  }
}
