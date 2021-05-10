import 'package:flutter/material.dart';
import 'package:login_fontend/model/login_model.dart';

class Lights extends StatelessWidget {
  UserModel user;
  Lights(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('Lights'),
        ),
        body: Center(
          child: Text(
            "Lights",
          ),
        ));
  }
}
