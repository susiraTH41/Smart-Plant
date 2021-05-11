import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:login_fontend/model/login_model.dart';
import 'package:login_fontend/model/sensor/allSensor_model.dart';
import 'package:login_fontend/provider/provider_sensor.dart';
import 'package:login_fontend/screen/pages/management/sensor/addsensor.dart';
import 'package:login_fontend/screen/pages/management/sensor/editsensor.dart';

class AllSensor extends StatelessWidget {
  final String title;
  UserModel user;
  AllSensor({this.title, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _AllSensor(title: title, user: user),
    );
  }
}

class _AllSensor extends StatefulWidget {
  _AllSensor({Key key, this.title, this.user}) : super(key: key);
  final String title;
  UserModel user;
  @override
  State<StatefulWidget> createState() {
    return _AllSensorState();
  }
}

class _AllSensorState extends State<_AllSensor>
    with AutomaticKeepAliveClientMixin {
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
                            builder: (context) => EditSensor(
                                widget.user,
                                allsensor.id[index],
                                allsensor.place[index],
                                allsensor.deviceStatus[index])),
                      );
                    },
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddSensor(widget.user)),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
