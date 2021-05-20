import 'package:flutter/material.dart';
import 'package:login_fontend/api/devices/api_control.dart';
import 'package:login_fontend/mqtt/mqtt.dart';
import 'package:mqtt_client/mqtt_client.dart';

class SwitchControl extends StatefulWidget {
  String userid;
  String deviceID;
  String isMqtt;
  String topic;
  SwitchControl(this.userid, this.deviceID, this.isMqtt, this.topic);
  @override
  SwitchClass createState() =>
      new SwitchClass(this.userid, this.deviceID, this.isMqtt, this.topic);
}

class SwitchClass extends State {
  String userid;
  String deviceID;
  String isMqtt;

  SwitchClass(this.userid, this.deviceID, this.isMqtt, this.topic);
  MqttClient client;
  //MQTTManager _manager = MQTTManager();
  var topic;
  //SwitchClass({this.topic,this.deviceID});
  bool isSwitched = false;
  var textValue = 'Switch is OFF';
  void _publish(String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client?.publishMessage(topic, MqttQos.atLeastOnce, builder.payload);
  }

  void toggleSwitch(bool value) {
    // subScribeTo(topic,client);
    if (isSwitched == false) {
      setState(() {
        print("1");
        isSwitched = true;
        control(userid, deviceID, isMqtt, '1');
        //this._publish('green');
        textValue = 'Switch Button is ON';
      });
      //print('Switch Button is ON');
    } else {
      setState(() {
        print("0");
        isSwitched = false;
        control(userid, deviceID, isMqtt, '0');
        //this._publish('red');
        textValue = 'Switch Button is OFF';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('123qwe${userid}');
    print('qweasd${deviceID}');
    print('123qwe${isMqtt}');
//    _manager.initializeMQTTClient();
//    _manager.connect1();
//    _manager.subScribeTo(topic);
    connect().then((value) {
      this.client = value;
      //print('cecwcwec  ${client.subscribe(topic, MqttQos.atLeastOnce)}');
      client.subscribe(topic, MqttQos.atLeastOnce);
      subScribeTo(topic, client);
    });

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Transform.scale(
          scale: 2,
          child: Switch(
            onChanged: toggleSwitch,
            value: isSwitched,
            activeColor: Colors.white,
            activeTrackColor: Colors.greenAccent[400],
            inactiveThumbColor: Colors.black87,
            inactiveTrackColor: Colors.black54,
          )),
      Text(
        '$textValue',
        style: TextStyle(fontSize: 20),
      )
    ]);
  }

  subScribeTo(String topic, client) {
    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload;
      String pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      print('acsaca$pt');

      if (pt == "ON" && !isSwitched) {
        toggleSwitch(false);
      } else if (pt == "OFF" && isSwitched) {
        toggleSwitch(false);
      }
    });
  }
}
