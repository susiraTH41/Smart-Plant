import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:login_fontend/model/login_model.dart';
import 'package:login_fontend/model/devices/allDevices_model.dart';
import 'package:login_fontend/provider/provider_devices.dart';

import 'package:login_fontend/screen/pages/device/sw.dart';

class AllDevices extends StatelessWidget {
  final String title = '';
  UserModel user;
  AllDevices(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _AllDevices(title: title, user: user),
    );
  }
}

class _AllDevices extends StatefulWidget {
  _AllDevices({Key key, this.title, this.user}) : super(key: key);
  final String title;
  UserModel user;
  @override
  State<StatefulWidget> createState() {
    return _AllDevicesState();
  }
}

class _AllDevicesState extends State<_AllDevices>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;
  String text;
  @override
  void initState() {
    super.initState();
    final alldevices = Provider.of<DevicesProvider>(context, listen: false);
    alldevices.getPostDevices(widget.user.userinfo.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text('Controls'),
      ),
      body: Consumer(
        builder: (context, DevicesProvider alldevices, Widget child) {
          return ListView.builder(
              itemCount: alldevices.place.length,
              itemBuilder: (BuildContext content, int index) {
                if (alldevices.isMqtt[index]) {
                  text = '${alldevices.place[index]} (MQTT)';
                } else {
                  text = '${alldevices.place[index]} (LoRa)';
                }
                return Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(text, style: TextStyle(fontSize: 24.0)),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SW(
                                  widget.user.userinfo.id.toString(),
                                  alldevices.id[index].toString(),
                                  alldevices.isMqtt[index].toString(),
                                  alldevices.deviceID[index],
                                )),
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
