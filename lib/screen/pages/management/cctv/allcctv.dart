import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:login_fontend/model/login_model.dart';
import 'package:login_fontend/model/cctv/allCctv_model.dart';
import 'package:login_fontend/provider/provider_cctv.dart';

import 'package:login_fontend/screen/pages/device/cctv.dart';

import 'package:login_fontend/screen/pages/management/cctv/addcctv.dart';
import 'package:login_fontend/screen/pages/management/cctv/editcctv.dart';

class AllCctv extends StatelessWidget {
  final String title;
  UserModel user;
  AllCctv({this.title, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _AllCctv(title: title, user: user),
    );
  }
}

class _AllCctv extends StatefulWidget {
  _AllCctv({Key key, this.title, this.user}) : super(key: key);
  final String title;
  UserModel user;
  @override
  State<StatefulWidget> createState() {
    return _AllCctvState();
  }
}

class _AllCctvState extends State<_AllCctv> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  @override
  void initState() {
    super.initState();
    final allcctv = Provider.of<CctvProvider>(context, listen: false);
    allcctv.getPostCctv(widget.user.userinfo.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, CctvProvider allcctv, Widget child) {
          return ListView.builder(
              itemCount: allcctv.name.length,
              itemBuilder: (BuildContext content, int index) {
                return Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text('${allcctv.name[index]}',
                        style: TextStyle(fontSize: 24.0)),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      //print('fasfasf${allcctv.deviceStatus[index]}');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditCctv(
                                widget.user,
                                allcctv.name[index],
                                allcctv.status[index],
                                allcctv.user_cctv[index],
                                allcctv.pass_cctv[index],
                                allcctv.ip[index].toString(),
                                allcctv.id_cctv[index].toString())),
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
            MaterialPageRoute(builder: (context) => AddCctv(widget.user)),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
