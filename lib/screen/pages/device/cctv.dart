import 'package:flutter/material.dart';
import 'package:login_fontend/model/login_model.dart';

class Cctv extends StatelessWidget {
  UserModel user;
  Cctv(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('Cctv'),
        ),
        body: Center(
          child: Text(
            "Cctv",
          ),
        ));
  }
}
