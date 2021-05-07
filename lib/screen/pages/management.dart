import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login_fontend/model/login_model.dart';
import 'package:login_fontend/screen/tamplate/menu_item.dart';
import 'package:login_fontend/screen/pages/management/adduser.dart';
import 'package:login_fontend/screen/pages/management/alluser.dart';
import 'package:login_fontend/screen/pages/management/alldevices.dart';



class Management extends StatefulWidget {
   UserModel user ;
   Management(this.user);
  //Management({Key key}) : super(key: key);
  @override
  _ManagementState createState() => _ManagementState(this.user);
}

class _ManagementState extends State<Management> with SingleTickerProviderStateMixin {
  TabController controller;
  UserModel user;
  _ManagementState(this.user);
  @override
  void initState(){
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Management'),
        bottom: TabBar(
    labelColor: Color(0xffffffff), // สีของข้อความปุ่มที่เลือก
    unselectedLabelColor: Color(0x55ffffff), // สีของข้อความปุ่มที่ไม่ได้เลือก
    tabs: <Tab>[
        Tab(icon: Icon(Icons.person_search), text: 'User Management'),
        Tab(icon: Icon(Icons.desktop_windows), text: 'Devices Management'),
    ],
    controller: controller,
),
      ),
      body: TabBarView(
    children: <Widget>[AllUser(title:'หน้า 1',user:this.user), AllDevices(title:'หน้า 2',user:this.user)],
    controller: controller,
),
     
    );
  }
}
