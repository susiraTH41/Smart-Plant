import 'package:flutter/material.dart';
import 'package:login_fontend/api/api_control.dart';
import 'package:login_fontend/mqtt/mqtt.dart';
import 'package:login_fontend/mqtt/mqttManager.dart';
import 'package:mqtt_client/mqtt_client.dart';  


class SwitchControl extends StatefulWidget {  
  String topic ;
  String deviceID ="23622";
  //SwitchControl({this.topic,this.deviceID});
  @override  
  SwitchClass createState() => new SwitchClass();  
}  
  
class SwitchClass extends State {  
  MqttClient client;
  //MQTTManager _manager = MQTTManager();
  var topic = '8zZacMGJWd/color';
  String deviceID ;
  //SwitchClass({this.topic,this.deviceID});
  bool isSwitched = false;  
  var textValue = 'Switch is OFF';  
 /* void _publish(String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client?.publishMessage(topic, MqttQos.atLeastOnce, builder.payload);
  }*/
  
  
  void toggleSwitch(bool value) {  
     // subScribeTo(topic,client); 
    if(isSwitched == false)  
    {  
      setState(() {  
        isSwitched = true;  
        //control("ON",deviceID);
        //this._publish('green');
        textValue = 'Switch Button is ON'; 
      });  
      //print('Switch Button is ON');  
    }  
    else  
    {  
      setState(() {  
        isSwitched = false;  
        //control("OFF",deviceID);
        //this._publish('red');
        textValue = 'Switch Button is OFF';  
      });  
      //print('Switch Button is OFF');  
    }  
  }  
  @override  
  Widget build(BuildContext context) { 
//    _manager.initializeMQTTClient(); 
//    _manager.connect1();
//    _manager.subScribeTo(topic);
    connect().then((value) {
                  this.client = value;
                  print('cecwcwec  ${client.subscribe(topic, MqttQos.atLeastOnce)}');
                 // subScribeTo(topic,client); 
                });
    
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,  
        children:[ Transform.scale(  
            scale: 2,  
            child: Switch(  
              onChanged: toggleSwitch,  
              value: isSwitched,  
              activeColor: Colors.white,  
              activeTrackColor: Colors.greenAccent[400],  
              inactiveThumbColor: Colors.black87,  
              inactiveTrackColor: Colors.black54,  
            )  
          ),  
          Text('$textValue', style: TextStyle(fontSize: 20),)  
        ]);  
  }

  subScribeTo(String topic,client) {
    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload;
      String pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      print('acsaca$pt');
  
      if(pt =="green" && !isSwitched){
          toggleSwitch(false);
         
          //i=10;
        
      }else if(pt =="red" && isSwitched ){
         toggleSwitch(false);
         
         //i=10;
        }
        
      

    });
  }
}  


//////////////////////////////////////////// select room
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'Select Room';


  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Select Room', '23601', '23602', '23603', '23604']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
