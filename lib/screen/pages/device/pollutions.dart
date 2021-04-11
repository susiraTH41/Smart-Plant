import 'package:flutter/material.dart';
import 'package:login_fontend/api/api_pollutions.dart';
import 'package:login_fontend/model/pollutions_model.dart';
import 'package:login_fontend/screen/tamplate/menu_item.dart';


class Pollutions extends StatefulWidget {
  @override
  _PollutionsState createState() => _PollutionsState();
}

class _PollutionsState extends State<Pollutions> {

  @override
  void initState() {
    super.initState();
    pollutions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
        appBar: AppBar(
          title: Text("Pollutions"),
        ),
         body: FutureBuilder(
          future: pollutions(),
          builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              dynamic result = snapshot.data ;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    BuildBox(title:"PM 1",amount : result[0].pm1??= 0,varible:"μg/m³", color:Colors.lightGreen),
                    BuildBox(title:"PM 2.5",amount : result[0].pm25??= 0,varible:"μg/m³",color:Colors.lightGreen),
                    BuildBox(title:"PM 10",amount : result[0].pm10??= 0,varible:"μg/m³",color: Colors.lightGreen),
                    BuildBox(title:"Temperature",amount : result[0].temperature??= 0,varible:"C", color:Colors.lightGreen),
                    BuildBox(title:"NO2",amount : result[0].no2??= 0,varible:"ppb",color:Colors.lightGreen),
            
                  ],

                ),
              );
            }
            return  LinearProgressIndicator();
          },)
        
        );
  }


}