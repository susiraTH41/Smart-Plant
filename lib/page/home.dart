import 'package:flutter/material.dart';
import '../Tamplate.dart';
import 'login.dart';
import '../model/login_model.dart';
class MyHomePage extends StatefulWidget {
  UserModel user;
  MyHomePage(this.user);
  @override
  _MyHomePageState createState() => _MyHomePageState(this.user);
}
 
class _MyHomePageState extends State<MyHomePage> {
  UserModel user;
  _MyHomePageState(this.user);
  @override
  initState() {
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
         backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Smart Plants"),
          actions: <Widget> [IconButton(
                icon: Icon(Icons.exit_to_app),
                color: Colors.white,
                onPressed: () {
                   signOut(context);
                })],
        ),
        body: Center(
          child: Column(children: [
            //Image.asset("./asset/image/1.JPG",width: 250,height: 200,),
            Text("Pollution Status : ${user.userinfo.email}"),
            MyStatefulWidget(),
            BoxxDoor(),   
            BoxxAir(),
            BoxxLights()
          ],),
        ),);
  }
  void signOut(BuildContext context) {
    print(user.success);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        ModalRoute.withName('/'));
  }
}
