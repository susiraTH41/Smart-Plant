import 'package:flutter/material.dart';
import 'package:login_fontend/model/login_model.dart';

class Door extends StatelessWidget {
  UserModel user;
  Door(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('door'),
        ),
        body: Center(
          child: Text(
            "door",
          ),
        ));
  }
}
