import 'package:flutter/material.dart';
import 'package:login_fontend/model/login_model.dart';
import 'package:login_fontend/screen/pages/log.dart';
import 'package:login_fontend/screen/pages/management.dart';
import 'package:login_fontend/screen/pages/setting.dart';
import 'home.dart';
import 'pages/homepage.dart';
import 'pages/devices.dart';


class MenuAdmin extends StatefulWidget {
 
  //UserModel user;
 // MenuAdmin(this.user);
  @override
  State<StatefulWidget> createState() => _MenuAdminState();
}

class _MenuAdminState extends State<MenuAdmin> {
  UserModel user;
  //MenuAdminState(this.user);
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  
  List<Widget> _pageWidget()  => <Widget> [
    Devices(this.user),
    Logs(this.user),
    HomePage(),
    Management(this.user),
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
      appBar: AppBar(
        title: const Text('Smart Plans '),
      ),
      body: Center(
        child: pageWidget .elementAt(_selectedIndex),
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
