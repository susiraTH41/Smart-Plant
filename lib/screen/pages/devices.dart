import 'package:flutter/material.dart';
import 'package:login_fontend/api/devices/api_pollutions.dart';
import 'package:login_fontend/model/login_model.dart';
import 'package:login_fontend/screen/tamplate/menu_item.dart';
import 'package:web_socket_channel/io.dart';

import 'device/cctv.dart';
import 'device/pollutions.dart';


class Devices extends StatelessWidget {
  UserModel user ;
  Devices(this.user);
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
                  title:"Doors",
                  color: Colors.brown[300],
                  onTap: (){
                    print("1");
                  }, 
                  icon: Icon(Icons.sensor_door,color: Colors.white,size:50)
                ),BuildMenuItem(
                  title:"Lights",
                  color: Colors.yellowAccent[400],
                  onTap: (){
                    print("1");
                  }, 
                  icon: Icon(Icons.wb_incandescent_outlined,color: Colors.white,size:50)
                ),
                
            ],)
              ),Row(
                children: [
                  BuildMenuItem(
                    title:"Pollutions",
                    color: Colors.purple[700],
                    onTap: (){
                      Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Pollutions()),
                                  );
                    }, 
                    icon: Icon(Icons.waves,color: Colors.white,size:50)
                  ),
                BuildMenuItem(
                  title:"CCTV",
                  color: Colors.orange[300],
                  onTap: (){
                   Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CCTV(channel: IOWebSocketChannel.connect('ws://10.64.69.253:8888'))),
                                  );
                  }, 
                  icon: Icon(Icons.photo_camera_front,color: Colors.white,size:50)
                ),
                 
                ],
              ),

              
            
              
              
            ],
          ),
        ),
      
    );
  }
}
