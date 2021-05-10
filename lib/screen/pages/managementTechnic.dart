import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login_fontend/model/login_model.dart';
import 'package:login_fontend/screen/tamplate/menu_item.dart';
import 'package:login_fontend/screen/pages/management/devices/alldevices.dart';
import 'package:login_fontend/screen/pages/management/sensor/allsensor.dart';

class ManagementTechnic extends StatefulWidget {
  UserModel user;
  ManagementTechnic(this.user);
  //Management({Key key}) : super(key: key);
  @override
  _ManagementTechnicState createState() => _ManagementTechnicState(this.user);
}

class _ManagementTechnicState extends State<ManagementTechnic>
    with SingleTickerProviderStateMixin {
  TabController controller;
  UserModel user;
  _ManagementTechnicState(this.user);
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text('Management'),
        bottom: TabBar(
          labelColor: Color(0xffffffff), // สีของข้อความปุ่มที่เลือก
          unselectedLabelColor:
              Color(0x55ffffff), // สีของข้อความปุ่มที่ไม่ได้เลือก
          tabs: <Tab>[
            Tab(icon: Icon(Icons.desktop_windows), text: 'Devices'),
            Tab(icon: Icon(Icons.cloud), text: 'Sensor'),
          ],
          controller: controller,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          AllDevices(title: 'หน้า 2', user: this.user),
          AllSensor(title: 'หน้า 3', user: this.user)
        ],
        controller: controller,
      ),
    );
  }
}
