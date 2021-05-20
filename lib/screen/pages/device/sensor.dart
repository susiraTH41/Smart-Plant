import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:login_fontend/model/login_model.dart';
import 'package:login_fontend/model/sensor/allSensor_model.dart';
import 'package:login_fontend/provider/provider_sensor.dart';

import 'Pollutions.dart';

class Sensor extends StatelessWidget {
  UserModel user;
  Sensor(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Sensor(user: user),
    );
  }
}

class _Sensor extends StatefulWidget {
  _Sensor({Key key, this.user}) : super(key: key);
  UserModel user;
  @override
  State<StatefulWidget> createState() {
    return _SensorState();
  }
}

class _SensorState extends State<_Sensor> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  @override
  void initState() {
    super.initState();
    final allsensor = Provider.of<SensorProvider>(context, listen: false);
    allsensor.getPostSensor(widget.user.userinfo.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text('Check status'),
      ),
      body: Consumer(
        builder: (context, SensorProvider allsensor, Widget child) {
          return ListView.builder(
              itemCount: allsensor.place.length,
              itemBuilder: (BuildContext content, int index) {
                return Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text('${allsensor.place[index]}',
                        style: TextStyle(fontSize: 24.0)),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      print('fasfasf${allsensor.deviceStatus[index]}');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Pollutions(
                                allsensor.battery[index],
                                allsensor.no2[index],
                                allsensor.pm1[index],
                                allsensor.pm25[index],
                                allsensor.pm10[index],
                                allsensor.pressure[index],
                                allsensor.temperature[index],
                                allsensor.humidity[index],
                                allsensor.led[index])),
                      );
                    },
                  ),
                );
              });
        },
      ),
    );
  }
}
