import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:login_fontend/model/login_model.dart';
import 'package:login_fontend/provider/provider_user.dart';
import 'package:login_fontend/screen/pages/management/adduser.dart';
import 'package:login_fontend/screen/pages/management/editUser.dart';

class AllUser extends StatelessWidget {
 
  final String title;
  UserModel user;
  AllUser({this.title, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _AllUser(title: title, user: user),
    );
  }
}

class _AllUser extends StatefulWidget {
  _AllUser({Key key, this.title, this.user}) : super(key: key);
  final String title;
  UserModel user;
  @override
  State<StatefulWidget> createState() {
    return _AllUserState();
  }
}

class _AllUserState extends State<_AllUser> with AutomaticKeepAliveClientMixin {
  
   
  
  @override
  bool get wantKeepAlive => false;
 
  @override
  void initState() {
    super.initState();
    final alluser = Provider.of<UserProvider>(context, listen: false);
    alluser.getPostUser(widget.user.userinfo.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, UserProvider alluser, Widget child) {
          return ListView.builder(
              itemCount: alluser.email.length,
              itemBuilder: (BuildContext content, int index) {
                // var device = devices.rooms[index];

                // print('dasdsadad${alluser.alluser.alluser}');
                return Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text('${alluser.email[index]}',
                        style: TextStyle(fontSize: 24.0)),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditUser(
                                widget.user,
                                alluser.userId[index],
                                alluser.email[index],
                                alluser.first_name[index],
                                alluser.last_name[index],
                                alluser.rank[index])),
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
