import 'package:flutter/material.dart';
import 'package:login_fontend/api/api_control.dart';
import 'package:login_fontend/screen/tamplate/buttom_item.dart';
import 'package:mqtt_client/mqtt_client.dart';
import '../Tamplate.dart';
import '../mqtt/mqtt.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  MqttClient client;
 /* var topic = '8zZacMGJWd/color';
  dynamic selections = [true, false];
  void _publish(String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client?.publishMessage(topic, MqttQos.atLeastOnce, builder.payload);
  }*/


  @override
  Widget build(BuildContext context) {
     /* connect().then((value) {
                  this.client = value;
                  this.client?.subscribe(this.topic, MqttQos.atLeastOnce);
                });*/
    return Scaffold(
      appBar: AppBar(
        title: Text('widget.title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchControl(),
            /*RaisedButton( 
              child: Text('Connect'),
              onPressed: () => {
                connect().then((value) {
                  client = value;
                })
              },
            ),
            RaisedButton(
              child: Text('Subscribe'),
              onPressed: () {
                return {client?.subscribe(topic, MqttQos.atLeastOnce)};
              },
            ),
            RaisedButton(
              child: Text('Publish'),
              onPressed: () => {this._publish('green')},
            ),
            RaisedButton(
              child: Text('Publish'),
              onPressed: () => {this._publish('red')},
            ),
            RaisedButton(
              child: Text('Unsubscribe'),
              onPressed: () => {client?.unsubscribe(topic)},
            ),
            RaisedButton(
              child: Text('Disconnect'),
              onPressed: () => {client?.disconnect()},
            ),*/
          ],
        ),
      ),
    );
  }
}
