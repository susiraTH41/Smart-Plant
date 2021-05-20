import 'package:flutter/material.dart';
import 'package:login_fontend/model/login_model.dart';
import 'package:login_fontend/screen/tamplate/Log_box.dart';
import 'package:login_fontend/provider/provider_logUser.dart';

import 'package:provider/provider.dart';

class UserLogs extends StatefulWidget {
  UserModel user;
  UserLogs(this.user);

  @override
  _UserLogsState createState() => _UserLogsState(this.user);
}

class _UserLogsState extends State<UserLogs> {
  UserModel user;
  _UserLogsState(this.user);

  @override
  void initState() {
    super.initState();
    final alllog = Provider.of<UserLogProvider>(context, listen: false);
    alllog.getPostLogUser(widget.user.userinfo.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    List<MoneyBox> menu = [];

    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('User Log'),
        ),
        body:
            Consumer(builder: (context, UserLogProvider alllog, Widget child) {
          for (int i = 0; i < alllog.first_name.length; i++) {
            menu.add(MoneyBox(
              "EMAIL : ${alllog.first_name[i]}",
              "Log : ${alllog.actionTxt[i]}",
              "Time : ${alllog.dateformat1[i]}",
            ));
          }
          return ListView.builder(
            itemCount: menu.length,
            itemBuilder: (BuildContext, int index) {
              MoneyBox box = menu[index];
              return box;
            },
          );
        }));
  }
}


