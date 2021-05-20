import 'package:flutter/material.dart';
import 'package:login_fontend/model/login_model.dart';
import 'package:login_fontend/screen/pages/log.dart';
import 'package:login_fontend/screen/pages/setting.dart';
import 'package:login_fontend/screen/pages/homepage.dart';
import 'package:login_fontend/screen/pages/devices.dart';

class MenuMember extends StatefulWidget {
  UserModel user;
  MenuMember(this.user);
  @override
  State<StatefulWidget> createState() => _MenuMemberState(this.user);
}

class _MenuMemberState extends State<MenuMember> {
  UserModel user;
  _MenuMemberState(this.user);
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _pageWidget() => <Widget>[
        Devices(this.user),
        Logs(this.user),
        HomePage(),
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
