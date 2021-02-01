import 'package:flutter/material.dart';
import '../model/login_model.dart';
import '../api/api_login.dart' ;
import 'home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: UIloginPage(),
      theme: ThemeData(primaryColor: Colors.deepPurpleAccent),
    );
  }
}

class UIloginPage extends StatefulWidget {
  @override
  _UIloginPageState createState() => _UIloginPageState();
}

class _UIloginPageState extends State<UIloginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Smart Plants"),
        ),
          body: Container(
            child: Center(
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.deepPurpleAccent)
                      ),
                  margin: EdgeInsets.all(32),
                  padding: EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildTextFieldEmail(),
                      buildTextFieldPassword(),
                      buildButtonSignIn()
                      
                    ],
                  )),
            )
          )
    );
  }
  Container buildTextFieldEmail() {
  return Container( width: 350,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      border: Border.all( 
        color: Colors.deepPurpleAccent,width: 2
      ), 
    ),
    child: TextField( controller: emailController ,
      decoration: InputDecoration.collapsed(
        hintText: "User ",
        hintStyle: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold)
      ),
      style: TextStyle(fontSize: 18,color: Colors.black)
    )
  );
}

Container buildTextFieldPassword() {
  return Container( width: 350,
    padding: EdgeInsets.all(12),
    margin: EdgeInsets.only(top: 12),
   decoration: BoxDecoration(
     border: Border.all( 
      color: Colors.deepPurpleAccent,width: 2
     ),  
    ),
    child: TextField(   controller: passwordController ,
      decoration: InputDecoration.collapsed(hintText: "Password ",hintStyle: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold)),
      style: TextStyle(fontSize: 18,color: Colors.black),
      obscureText: true 
    )
  );
}


  Widget  buildButtonSignIn(){
    return InkWell(
          child: Container( 
          constraints: BoxConstraints.expand(height: 50,width: 100),
          child: Text("Sign in",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white)),
          decoration: BoxDecoration(
             gradient: LinearGradient(
          colors: [Colors.deepPurpleAccent,Colors.deepPurpleAccent[400],Colors.deepPurpleAccent[700]]
        ),
              borderRadius: BorderRadius.circular(16), color: Colors.green[200]),
          margin: EdgeInsets.only(top: 16),
          padding: EdgeInsets.all(12)),
          onTap: () {
              signIn();
          },
    );
  }

  void signIn() async{
    try{
      UserModel user = await loginUser(emailController.text.trim(),passwordController.text.trim()).timeout(const Duration(seconds: 5));
      //print(user);
      bool success = user.success ;
      //print(success);
      if(success == true){
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage(user)));
      }else if(success == false){
        print("login error");
      }else{
        print("connect error1");
      }
    }catch (e){
      print("connect error2");
    }
  }
}