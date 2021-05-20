import 'package:flutter/material.dart';
import 'package:login_fontend/model/login_model.dart';
import 'package:login_fontend/screen/tamplate/Log_box.dart';
import 'package:login_fontend/provider/provider_log.dart';

import 'package:provider/provider.dart';

class AdminLogs extends StatefulWidget {
  UserModel user;
  AdminLogs(this.user);

  @override
  _AdminLogsState createState() => _AdminLogsState(this.user);
}

class _AdminLogsState extends State<AdminLogs> {
  UserModel user;
  _AdminLogsState(this.user);

  @override
  void initState() {
    super.initState();
    final alllog = Provider.of<AdminLogProvider>(context, listen: false);
    alllog.getPostLog(widget.user.userinfo.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    List<MoneyBox> menu = [];

    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('pollutions'),
        ),
        body:
            Consumer(builder: (context, AdminLogProvider alllog, Widget child) {
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
