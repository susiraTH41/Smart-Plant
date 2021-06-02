import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:login_fontend/provider/provider_user.dart';
import 'package:login_fontend/provider/provider_devices.dart';
import 'package:login_fontend/provider/provider_sensor.dart';
import 'package:login_fontend/provider/provider_cctv.dart';
import 'package:login_fontend/provider/provider_log.dart';
import 'package:login_fontend/provider/provider_logUser.dart';
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
  ChangeNotifierProvider<SensorProvider>(create: (_) => SensorProvider()),
  ChangeNotifierProvider<CctvProvider>(create: (_) => CctvProvider()),
  ChangeNotifierProvider<AdminLogProvider>(create: (_) => AdminLogProvider()),
  ChangeNotifierProvider<UserLogProvider>(create: (_) => UserLogProvider()),
];
