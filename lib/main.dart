import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:login_fontend/provider/provider_user.dart';
import 'package:login_fontend/provider/provider_devices.dart';

import 'screen/login.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: providers,
      child: LoginPage(),
    ),
  );
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
  ChangeNotifierProvider<DevicesProvider>(create: (_) => DevicesProvider()),
];

/*
import 'package:flutter/material.dart';
import 'package:login_fontend/screen/home.dart';
import 'screen/menuAdmin.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:login_fontend/provider/provider_user.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    ),
  );
}

   
List<SingleChildWidget> providers = [
  ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
  
];
class MyApp extends StatelessWidget {
  @override
 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuAdmin(),
    );
  }

}
*/
