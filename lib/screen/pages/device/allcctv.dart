import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:login_fontend/model/login_model.dart';
import 'package:login_fontend/model/cctv/allCctv_model.dart';
import 'package:login_fontend/provider/provider_cctv.dart';

import 'package:login_fontend/screen/pages/device/cctv.dart';

class AllCctv extends StatelessWidget {
  String title = '';
  UserModel user;
  AllCctv(this.user);

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
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text('CCTV'),
      ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Cctv(
                                  allcctv.name[index].toString(),
                                  allcctv.url[index],
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
