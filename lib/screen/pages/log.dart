import 'package:flutter/material.dart';
import 'package:login_fontend/model/login_model.dart';


class Logs extends StatelessWidget {
  UserModel user ;
  Logs(this.user);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Logs",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
  }
}
