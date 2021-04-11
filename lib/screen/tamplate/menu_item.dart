import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class BuildMenuItem extends StatelessWidget {
  final String title;
  final Color color;
  final Function onTap;
  final Icon icon;
  const BuildMenuItem({Key key, this.title, this.onTap,this.color,this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
        onTap: onTap,
        child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 2)
            ),
          height:110 ,
          width: 170,
          child: Column(
            children: [
              icon,
              Expanded(
                child: Text("${title}",
                  style:
                      TextStyle(fontSize: 25, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            SizedBox(width: 5,),
            ],
          ),
        ),
      ),
    );
  }
}



class BuildMenuItemLong extends StatelessWidget {
  final String title;
  final Color color;
  final Function onTap;
  final Icon icon;
  const BuildMenuItemLong({Key key, this.title, this.onTap,this.color,this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
        onTap: onTap,
        child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 2)
            ),
          height:110 ,
          width: 170,
          child: Column(
            children: [
              icon,
              Expanded(
                child: Text("${title}",
                  style:
                      TextStyle(fontSize: 25, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            SizedBox(width: 5,),
            ],
          ),
        ),
      ),
    );
  }

}

class BuildBox extends StatelessWidget {
  String title;
  String varible;
  int amount ;
  Color color ;
  double size ;

  BuildBox({this.title,this.amount,this.varible,this.color,this.size=100});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
               padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2)
                    ),
                height: size,
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 25, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                    ),
                    Expanded(
                      child: Text(
                        '${amount} ${varible}',
                        style:
                            TextStyle(fontSize: 25, 
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
              ),
    );
  }
}





