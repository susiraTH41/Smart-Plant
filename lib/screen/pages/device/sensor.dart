import 'package:flutter/material.dart';
import 'package:login_fontend/model/login_model.dart';

class Sensor extends StatelessWidget {
  UserModel user;
  Sensor(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('Sensor'),
        ),
        body: Center(
          child: Text(
            "Sensor",
          ),
        ));
  }
}
