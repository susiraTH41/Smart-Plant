import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_fontend/api/user/api_addUser.dart';
import 'package:login_fontend/model/user/addUser_model.dart';
import 'package:login_fontend/model/login_model.dart';

class AddUser extends StatefulWidget {
  UserModel user;
  AddUser(this.user);
  //AddUser({Key key}) : super(key: key);
  @override
  _AddUserState createState() => _AddUserState(this.user);
}

class _AddUserState extends State<AddUser> {
   UserModel user;
   _AddUserState(this.user);
  @override
  var email = TextEditingController();
  var password = TextEditingController();
  var first_name = TextEditingController();
  var last_name = TextEditingController();
  AddUserModel addsubmit;
  String dropdownValue = 'Select rank';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: ListView(children: [
            buildTextField("E-mail", email),
            buildTextField("Password", password),
            buildTextField("Firstname", first_name),
            buildTextField("Lastname", last_name),
            builddropdowns(),
            buildButtonSignIn()
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
      items: <String>['Select rank', 'MEMBER', 'ADMIN', 'STAFF', 'TECHNIC']
          .map<DropdownMenuItem<String>>((String value) {
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
        addsubmit = await addUser(
            this.email.text.trim(),
            this.password.text.trim(),
            this.first_name.text.trim(),
            this.last_name.text.trim(),
            this.dropdownValue,
            this.user.userinfo.id.toString());
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
