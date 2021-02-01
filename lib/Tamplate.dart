import 'package:flutter/material.dart';
import 'api/api_control.dart';
import 'model/control_model.dart';
//////////////////////////////////////////// select room
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'Select Room';


  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Select Room', '23601', '23602', '23603', '23604']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}



/////////////////////////    Toggle Buttons control Door
class BoxxDoor extends StatefulWidget {
  @override
  _BoxxDoorState createState() => _BoxxDoorState();
}

class _BoxxDoorState extends State<BoxxDoor> {
  @override
  List<bool> selections;
  Color selectColor = Colors.greenAccent ;
  @override
  void initState() {
    selections = [true, false];
    super.initState();
  }

  Widget build(BuildContext context) {
    //List<bool> _selections = List.generate(3, (index) => false);
    return Padding(
      padding: const EdgeInsets.only(left: 30 ,right: 30, bottom:  10, top: 5),
      child: Container(alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(30.0),
        decoration:
            BoxDecoration(color: Colors.white, border: Border.all(color: Colors.deepPurpleAccent)),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text( "DOOR",
                style: TextStyle(fontSize: 25) ),
            SizedBox(
              width: 80,
            ),
            Expanded(
              child: ToggleButtons(
                borderColor: Colors.deepPurpleAccent,
                fillColor: selectColor,
                selectedBorderColor: Colors.deepPurpleAccent,
                selectedColor: Colors.white,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'open',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'close',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < selections.length; i++) {
                      selections[i] = i == index;
                      
                    }
                    if(index==1){
                      selectColor = Colors.redAccent ;
                      control("ON","1515");
                    }
                    else{
                      selectColor = Colors.greenAccent ;
                      control("OFF","1515");
                    }
                  });
                },
                isSelected: selections,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/////////////////////////    Toggle Buttons control Air


class BoxxAir extends StatefulWidget {
  @override
  BoxxAir();
  _BoxxAirState createState() => _BoxxAirState();
}

class _BoxxAirState extends State<BoxxAir> {
  @override
  List<bool> selections;
  Color selectColor = Colors.greenAccent ;
  @override
  void initState() {
    selections = [true, false];
    super.initState();
  }

  Widget build(BuildContext context) {
    //List<bool> _selections = List.generate(3, (index) => false);
    return Padding(
      padding: const EdgeInsets.only(left: 30 ,right: 30, bottom:  10, top: 5),
      child: Container(alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(30.0),
        decoration:
            BoxDecoration(color: Colors.white, border: Border.all(color: Colors.deepPurpleAccent)),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text( "AIR",
                style: TextStyle(fontSize: 25) ),
            SizedBox(
              width: 130,
            ),
            Expanded(
              child: ToggleButtons(
                borderColor: Colors.deepPurpleAccent,
                fillColor: selectColor,
                selectedBorderColor: Colors.deepPurpleAccent,
                selectedColor: Colors.white,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'ON',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'OFF',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < selections.length; i++) {
                      selections[i] = i == index;
                      
                    }
                    if(index==1){
                      selectColor = Colors.redAccent ;
                      print('1');
                    }
                    else{
                      selectColor = Colors.greenAccent ;
                       print('11');
                    }
                  });
                },
                isSelected: selections,
              ),
            ),
          ],
        ),
      ),
    );
  }
}






/////////////////////////    Toggle Buttons control Lights

class BoxxLights extends StatefulWidget {
  @override
  _BoxxLightsState createState() => _BoxxLightsState();
}

class _BoxxLightsState extends State<BoxxLights> {
  @override
  List<bool> selections;
  Color selectColor = Colors.greenAccent ;
  @override
  void initState() {
    selections = [true, false];
    super.initState();
  }

  Widget build(BuildContext context) {
    //List<bool> _selections = List.generate(3, (index) => false);
    return Padding(
      padding: const EdgeInsets.only(left: 30 ,right: 30, bottom:  10, top: 5),
      child: Container(alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(30.0),
        decoration:
            BoxDecoration(color: Colors.white, border: Border.all(color: Colors.deepPurpleAccent)),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text( "LIGHTS",
                style: TextStyle(fontSize: 25) ),
            SizedBox(
              width: 80,
            ),
            Expanded(
              child: ToggleButtons(
                borderColor: Colors.deepPurpleAccent,
                fillColor: selectColor,
                selectedBorderColor: Colors.deepPurpleAccent,
                selectedColor: Colors.white,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'ON',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'OFF',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < selections.length; i++) {
                      selections[i] = i == index;
                      
                    }
                    if(index==1){
                      selectColor = Colors.redAccent ;
                      print('1');
                    }
                    else{
                      selectColor = Colors.greenAccent ;
                       print('11');
                    }
                  });
                },
                isSelected: selections,
              ),
            ),
          ],
        ),
      ),
    );
  }
}





/*




class BoxxLights extends StatefulWidget {
  @override
  String text ;
  BoxxLights(this.text);
  _BoxxLightsState createState() => _BoxxLightsState(text: this.text);
}

class _BoxxLightsState extends State<BoxxLights> {
  String text;
  @override
  List<bool> selections;
  Color selectColor = Colors.greenAccent ;
  _BoxxLightsState({this.text});
  @override
  void initState() {
    selections = [true, false];
    super.initState();
  }

  Widget build(BuildContext context) {
    //List<bool> _selections = List.generate(3, (index) => false);
    return Padding(
      padding: const EdgeInsets.only(left: 30 ,right: 30, bottom:  10, top: 5),
      child: Container(alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(30.0),
        decoration:
            BoxDecoration(color: Colors.white, border: Border.all(color: Colors.deepPurpleAccent)),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text( this.text,
                style: TextStyle(fontSize: 25) ),
            SizedBox(
              width: 80,
            ),
            Expanded(
              child: ToggleButtons(
                borderColor: Colors.deepPurpleAccent,
                fillColor: selectColor,
                selectedBorderColor: Colors.deepPurpleAccent,
                selectedColor: Colors.white,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'ON',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'OFF',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < selections.length; i++) {
                      selections[i] = i == index;
                      
                    }
                    if(index==1){
                      selectColor = Colors.redAccent ;
                      print('1');
                    }
                    else{
                      selectColor = Colors.greenAccent ;
                       print('11');
                    }
                  });
                },
                isSelected: selections,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/
