import 'package:flutter/material.dart';
import 'package:login_fontend/model/login_model.dart';
import 'package:login_fontend/screen/pages/setting/profile.dart';
import 'package:login_fontend/screen/pages/setting/changePass.dart';
import 'package:login_fontend/screen/login.dart';

class Setting extends StatelessWidget {
  UserModel user;
  Setting(this.user);
  final List<String> materialIndices = ["Profile", "Setting", "Logout"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('Setting'),
        ),
        body: Container(
          color: Colors.white,
          child: _buildList(context),
        ));
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
        itemCount: materialIndices.length,
        itemBuilder: (BuildContext content, int index) {
          String materialIndex = materialIndices[index];
          return Container(
            color: Colors.white,
            child: ListTile(
              title: Text('$materialIndex', style: TextStyle(fontSize: 24.0)),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                if (index == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile(this.user)));
                }
                if (index == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePassword(this.user)));
                }
                if (index == 2) {
                  this.user = null;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }
              },
            ),
          );
        });
  }
}
