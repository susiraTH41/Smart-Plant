import 'package:flutter/material.dart';
import 'package:login_fontend/model/login_model.dart';

import 'tamplate/menu_item.dart';


class Management extends StatelessWidget {
  UserModel user ;
  Management(this.user);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Row(children: [
                  BuildMenuItem(
                  title:"Add User",
                  color: Colors.green[400],
                  onTap: (){
                    print("1");
                  }, 
                  icon: Icon(Icons.person_add_alt_1,color: Colors.white,size:50)
                ),BuildMenuItem(
                  title:"Add Device",
                  color: Colors.green[400],
                  onTap: (){
                    print("1");
                  }, 
                  icon: Icon(Icons.add_to_queue_sharp,color: Colors.white,size:50)
                ),
                
            ],)
              ),Row(
                children: [
                  BuildMenuItem(
                  title:"Delete User",
                  color: Colors.red[400],
                  onTap: (){
                    print("1");
                  }, 
                  icon: Icon(Icons.person_remove,color: Colors.white,size:50)
                ),
                BuildMenuItem(
                  title:"Delete Device",
                  color: Colors.red[400],
                  onTap: (){
                    print("1");
                  }, 
                  icon: Icon(Icons.remove_from_queue,color: Colors.white,size:50)
                ),
                 
                ],
              ),
              Row(
                  children: [
                  BuildMenuItem(
                    title:"Edit User",
                    color: Colors.yellow[700],
                    onTap: (){
                      print("1");
                    }, 
                    icon: Icon(Icons.edit,color: Colors.white,size:50)
                  ),
                  BuildMenuItem(
                    title:"Edit Device",
                    color: Colors.yellow[700],
                    onTap: (){
                      print("1");
                    }, 
                    icon: Icon(Icons.edit,color: Colors.white,size:50)
                  ),
                
            ],)
              ,Row(
                children: [
                   BuildMenuItem(
                    title:"Search User",
                    color: Colors.lightBlue[700],
                    onTap: (){
                      print("1");
                    }, 
                    icon: Icon(Icons.person_search,color: Colors.white,size:50)
                  ),
                  
                  BuildMenuItem(
                    title:"Status Device",
                    color: Colors.lightBlue[700],
                    onTap: (){
                      print("1");
                    }, 
                    icon: Icon(Icons.desktop_windows,color: Colors.white,size:50)
                  ),
                ],
              ),
            
              
              
            ],
          ),
        ),
      
    );
  }
}
