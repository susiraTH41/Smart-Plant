import 'package:flutter/material.dart';
import 'package:login_fontend/model/login_model.dart';

class Logs extends StatelessWidget {
  UserModel user;
  Logs(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text('Logs'),
            ),
            body: Center(
                 child: Text("Logs", ),
                )
          );
  }
}
