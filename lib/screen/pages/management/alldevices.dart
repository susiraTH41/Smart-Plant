import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:login_fontend/model/login_model.dart';
import 'package:login_fontend/provider/provider_devices.dart';
import 'package:login_fontend/screen/pages/management/adduser.dart';
import 'package:login_fontend/screen/pages/management/editUser.dart';

class AllDevices extends StatelessWidget {
  final String title;
  UserModel user;
  AllDevices({this.title, this.user});

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

  @override
  void initState() {
    super.initState();
    final alldevices = Provider.of<DevicesProvider>(context, listen: false);
    alldevices.getPostDevices(widget.user.userinfo.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, DevicesProvider alldevices, Widget child) {
          return ListView.builder(
              itemCount: alldevices.email.length,
              itemBuilder: (BuildContext content, int index) {
                return Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text('${alldevices.email[index]}',
                        style: TextStyle(fontSize: 24.0)),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditUser(
                                widget.user,
                                alldevices.userId[index],
                                alldevices.email[index],
                                alldevices.first_name[index],
                                alldevices.last_name[index],
                                alldevices.rank[index])),
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
            MaterialPageRoute(builder: (context) => AddUser(widget.user)),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
