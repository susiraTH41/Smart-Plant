import 'package:flutter/material.dart';
import 'package:login_fontend/model/login_model.dart';
import 'package:login_fontend/screen/pages/log.dart';
import 'package:login_fontend/screen/pages/managementTechnic.dart';
import 'package:login_fontend/screen/pages/setting.dart';
import 'package:login_fontend/screen/pages/homepage.dart';
import 'package:login_fontend/screen/pages/devices.dart';

class MenuTechnic extends StatefulWidget {
  UserModel user;
  MenuTechnic(this.user);
  @override
  State<StatefulWidget> createState() => _MenuTechnicState(this.user);
}

class _MenuTechnicState extends State<MenuTechnic> {
  UserModel user;
  _MenuTechnicState(this.user);
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _pageWidget() => <Widget>[
        Devices(this.user),
        Logs(this.user),
        HomePage(),
        ManagementTechnic(this.user),
        Setting(this.user),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pageWidget = _pageWidget();
    return Scaffold(
      body: Center(
        child: pageWidget.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sensor_door_outlined),
            label: 'Controls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Logs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_rounded),
            label: 'Management',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black87,
        onTap: _onItemTapped,
      ),
    );
  }
}
