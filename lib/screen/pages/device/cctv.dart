import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:gesture_zoom_box/gesture_zoom_box.dart';

class Cctv extends StatefulWidget {
  String url;
  String text;
  Cctv(this.text,this.url);
  @override
  _CctvState createState() => _CctvState(this.text,this.url);
}

class _CctvState extends State<Cctv> {
  Key _key = GlobalKey<ScaffoldState>();
  _CctvState(this.text,this.url);
  String url;
  String text;
  VlcPlayerController vlcPlayerController;
  var _globalKey = new GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vlcPlayerController = new VlcPlayerController(onInit: () {
      vlcPlayerController.play();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    vlcPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      key: _key,
      appBar: AppBar(
        title: Text(text),
      ),
      body: Builder(builder: (context) {
        print(vlcPlayerController);
        return Container(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              RepaintBoundary(
                key: _globalKey,
                child: GestureZoomBox(
                  maxScale: 5.0,
                  doubleTapScale: 2.0,
                  duration: Duration(milliseconds: 200),
                  child: new VlcPlayer(
                      controller: vlcPlayerController,
                      aspectRatio: 16 / 9,
                      url: url,
                      isLocalMedia: false),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
