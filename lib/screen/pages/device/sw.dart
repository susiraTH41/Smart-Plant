import 'package:flutter/material.dart';
import 'package:login_fontend/api/devices/api_control.dart';
import 'package:login_fontend/screen/tamplate/buttom_item.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:login_fontend/mqtt/mqtt.dart';

class SW extends StatefulWidget {
  String userid;
  String deviceID;
  String isMqtt;
  String topic;
  @override
  SW(this.userid, this.deviceID, this.isMqtt, this.topic);
  _SWState createState() =>
      _SWState(this.userid, this.deviceID, this.isMqtt, this.topic);
}

class _SWState extends State<SW> {
  String userid;
  String deviceID;
  String isMqtt;
  String topic;
  _SWState(this.userid, this.deviceID, this.isMqtt, this.topic);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchControl(this.userid, this.deviceID, this.isMqtt, this.topic),
          ],
        ),
      ),
    );
  }
}
